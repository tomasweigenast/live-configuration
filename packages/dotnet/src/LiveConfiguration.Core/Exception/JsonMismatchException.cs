namespace LiveConfiguration.Core.Exception
{
    /// <summary>
    /// Exception thrown when JSON hard checking is made and the new object does not match
    /// the properties of the older one.
    /// </summary>
    public class JsonMismatchException : System.Exception
    {
        public JsonMismatchException(string message) : base(message) { }
    }
}