namespace LiveConfiguration.Core.Source
{
    /// <summary>
    /// Represents a reference to either a configuration group or a configuration entry
    /// </summary>
    public abstract class ConfigurationReference
    {
        private string mPath;

        /// <summary>
        /// The reference path
        /// </summary>
        public string Path => mPath;

        /// <summary>
        /// Initializes the configuration reference a gives an initial path
        /// </summary>
        protected ConfigurationReference()
        {
            mPath = "";
        }

        /// <summary>
        /// Appends a path name
        /// </summary>
        /// <param name="name">The name of the path.</param>
        protected void AppendPath(string name)
        {
            mPath += $"/{name}";
        }
    }
}