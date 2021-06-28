using System.Collections.Generic;

namespace LiveConfiguration.Provider.Firestore
{
    internal static class Helpers
    {
        public static T GetValueOrDefault<T>(this IDictionary<string, object> dictionary, string fieldName)
        {
            if (dictionary.TryGetValue(fieldName, out object value))
                return (T)value;

            return default;
        }
    }
}