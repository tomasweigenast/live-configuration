namespace LiveConfiguration.Core.Entry
{
    /// <summary>
    /// Represents the value type of a <see cref="IConfigurationEntry"/>
    /// </summary>
    public enum EntryValueType
    {
        String,
        Int,
        Double,
        Boolean,
        Map,
        List,
        Date,
        Duration,
    }
}