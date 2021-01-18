using System.Collections.Generic;

namespace LiveConfiguration.Core.Exception
{
    /// <summary>
    /// Contains the result of an update operation
    /// </summary>
    public class UpdateResult
    {
        /// <summary>
        /// The list of exceptions that happened, if any in the following format:
        /// Key: the index of the entry in the passed update list.
        /// Value: The exception that was thrown.
        /// </summary>
        public Dictionary<int, System.Exception> Exceptions { get; set; }

        /// <summary>
        /// The amount of failure updates
        /// </summary>
        public int FailedCount { get; set; }

        /// <summary>
        /// The amount of successful updates
        /// </summary>
        public int SuccessCount { get; set; }

        /// <summary>
        /// Default constructor
        /// </summary>
        public UpdateResult()
        {
            Exceptions = new Dictionary<int, System.Exception>();
        }
    }
}