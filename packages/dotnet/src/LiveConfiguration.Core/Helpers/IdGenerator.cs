using System;
using System.Security.Cryptography;
using System.Text;

namespace LiveConfiguration.Core.Helpers
{
    internal static class IdGenerator
    {
        private static readonly char[] mChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890".ToCharArray();

        public static string String()
        {
            int length = 12;
            byte[] buffer = new byte[4 * length];
            using RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
            for (int i = 0; i < 10; i++)
                rng.GetBytes(buffer);

            StringBuilder builder = new StringBuilder(length);
            for (int i = 0; i < length; i++)
            {
                uint random = BitConverter.ToUInt32(buffer, i * 4);
                long index = random % mChars.Length;
                builder.Append(mChars[index]);
            }

            return builder.ToString();
        }
    }
}