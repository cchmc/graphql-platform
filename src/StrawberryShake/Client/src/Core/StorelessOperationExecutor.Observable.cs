using System.Diagnostics;

namespace StrawberryShake;

public partial class StorelessOperationExecutor<TData, TResult>
{
    private sealed class StorelessOperationExecutorObservable : IObservable<IOperationResult<TResult>>
    {
        private readonly IConnection<TData> _connection;
        private readonly Func<IOperationResultBuilder<TData, TResult>> _resultBuilder;
        private readonly OperationRequest _request;

        public StorelessOperationExecutorObservable(
            IConnection<TData> connection,
            Func<IOperationResultBuilder<TData, TResult>> resultBuilder,
            OperationRequest request)
        {
            _connection = connection;
            _resultBuilder = resultBuilder;
            _request = request;
        }

        public IDisposable Subscribe(IObserver<IOperationResult<TResult>> observer)
        {
            var observerSession = new ObserverSession();
            BeginExecute(observer, observerSession);
            return observerSession;
        }

        private void BeginExecute(
            IObserver<IOperationResult<TResult>> observer,
            ObserverSession session) =>
            Task.Run(() => ExecuteAsync(observer, session));

        private async Task ExecuteAsync(
            IObserver<IOperationResult<TResult>> observer,
            ObserverSession session)
        {
            try
            {
                var token = session.RequestSession.Abort;
                var resultBuilder = _resultBuilder();

                await foreach (var response in
                    _connection.ExecuteAsync(_request)
                        .WithCancellation(token)
                        .ConfigureAwait(false))
                {
                    if (token.IsCancellationRequested)
                    {
                        return;
                    }

                    observer.OnNext(resultBuilder.Build(response));
                }
            }
            catch(ObjectDisposedException odex)
            {
                Debug.WriteLine($"--------------->>>> ObjectDisposedException in {nameof(StorelessOperationExecutorObservable)} <<<<---------------\n{odex.Message}");
                // If the  has unsubscribed, we will get an exception when we try to
                // notify it. We will just ignore this exception.???????
                observer.OnError(odex);
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Exception in {nameof(StorelessOperationExecutorObservable)} {ex.Message}");
                observer.OnError(ex);
            }
            finally
            {
                // call observer's OnCompleted method to notify observer
                // there is no further data is available.
                observer.OnCompleted();

                // after all the transport logic is finished we will dispose
                // the request session.
                session.RequestSession.Dispose();
            }
        }
    }
}
