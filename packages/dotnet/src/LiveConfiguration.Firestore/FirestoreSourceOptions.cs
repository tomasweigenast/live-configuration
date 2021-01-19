using Grpc.Core;

namespace LiveConfiguration.Firestore
{
    /// <summary>
    /// Options to configure an <see cref="FirestoreConfigurationSource"/> instance.
    /// </summary>
    public class FirestoreSourceOptions
    {
        /// <summary>
        /// The credentials to authenticate in Firestore
        /// </summary>
        public ChannelCredentials Credentials { get; set; }

        /// <summary>
        /// The project id to use
        /// </summary>
        public string ProjectId { get; set; }

        /// <summary>
        /// The name of the collection where the entries will be saved
        /// </summary>
        public string CollectionName { get; set; }

        /// <summary>
        /// The endpoint Firestore should use. Leave null to use the default.
        /// </summary>
        public string Endpoint { get; set; }
    }
}