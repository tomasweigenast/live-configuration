using LiveConfiguration.Core.Source;
using System;
using System.Collections.Generic;

namespace LiveConfiguration.Core.Helpers
{
    internal static class HelperMethods
    {
        public static T GetValue<T>(this Dictionary<string, object> dictionary, string key)
        {
            if (dictionary.ContainsKey(key))
                return (T)dictionary[key];
            else
                return default;
        }

        /// <summary>
        /// Parses a chainable <see cref="ConfigurationReference"/> to a array of 
        /// strings containing the paths
        /// </summary>
        public static string[] ToStringArray(this ConfigurationReference reference)
        {
            string[] split = reference.Path.Split('/', System.StringSplitOptions.RemoveEmptyEntries);
            if (split.Length <= 0)
                throw new ArgumentException("Cannot parse an empty configuration reference.");

            string[] array = new string[split.Length];
            for(int i = 0; i < array.Length; i++)
            {
                string[] definitions = split[i].Split('=', System.StringSplitOptions.RemoveEmptyEntries);
                if (definitions.Length <= 0)
                    throw new ArgumentException("Cannot parse and invalid or empty configuration reference path.");

                array[i] = definitions[1];
            }

            return array;
        }
    }
}