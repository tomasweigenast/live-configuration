using Grpc.Core;

namespace LiveConfiguration.Firestore
{
    /// <summary>
    /// Options to configure an <see cref="FirestoreLiveConfigurationSource"/> instance.
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
        /// The serializer used to serialize/deserialize entries
        /// </summary>
        public Serializer Serializer { get; set; }
    }

    /// <summary>
    /// Represents a serializer used to serialize/deserialize entries to/from Firestore
    /// </summary>
    public enum Serializer
    {
        Json,
        MessagePack
    }
}