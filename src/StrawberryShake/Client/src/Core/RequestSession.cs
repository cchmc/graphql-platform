using System.Diagnostics;

namespace StrawberryShake;

internal class RequestSession : IDisposable
{
    private readonly CancellationTokenSource _cts;
    private bool _disposed;

    public RequestSession()
    {
        _cts = new CancellationTokenSource();
    }

    public CancellationToken Abort
    {
        get
        {
            if (_disposed)
            {
                Debug.WriteLine("----------->>>> RequestSession is disposed on obtaining the token through Abort. <<<<-----------");
                throw new ObjectDisposedException(nameof(RequestSession));
            }
            return _cts.Token;
        }
    }

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
        if (!_disposed)
        {
            Cancel();
            _cts.Dispose();
            _disposed = true;
        }
    }
}
