using System;

namespace LiveConfiguration.Core.Exception
{
    /// <summary>
    /// Exception thrown when is tried to update an <see cref="IEntry"/> with an invalid value
    /// </summary>
    public class InvalidValueTypeException : System.Exception
    {
        /// <summary>
        /// The name of the entry
        /// </summary>
        public string EntryName { get; }

        /// <summary>
        /// The correct value type of the entry
        /// </summary>
        public ValueType ValueType { get; }

        /// <summary>
        /// The invalid object type
        /// </summary>
        public Type InvalidType { get; }

        /// <summary>
        /// Creates a new instance
        /// </summary>
        /// <param name="entryName">The name of the entry that was not found.</param>
        /// <param name="valueType">The correct value type of the entry.</param>
        /// <param name="invalidValue">The invalid value type.</param>
        public InvalidValueTypeException(string entryName, ValueType valueType, Type invalidType) : base($"An entry named '{entryName}' could not be updated with a {invalidType} because it does not match with the entry value type: {valueType}.")
        {
            EntryName = entryName;
            ValueType = valueType;
            InvalidType = invalidType;
        }
    }
}