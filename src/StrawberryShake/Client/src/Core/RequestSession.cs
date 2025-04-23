namespace StrawberryShake;

internal class RequestSession : IDisposable
{
    private readonly CancellationTokenSource _cts;
    public readonly CancellationToken _cancellationToken; // Removed field initializer

    private bool _disposed;

    public RequestSession()
    {
        _cts = new CancellationTokenSource();
        _cancellationToken = _cts.Token; // Initialize here
    }

    public CancellationToken Abort => _cancellationToken;

    public void Cancel()
    {
        try
        {
            if (!_disposed)
            {
                _cts.Cancel();
            }
        }
        catch (ObjectDisposedException)
        {
            // we do not care if this happens.
        }
    }
    public void Dispose()
    {
        Cancel();
        _cts.Dispose();
        _disposed = true;
    }
}