namespace LiveConfiguration.Core.Entry
{
    /// <summary>
    /// Represents the value type of a <see cref="IConfigurationEntry"/>
    /// </summary>
    public enum EntryValueType
    {
        String = 0,
        Int = 1,
        Double = 2,
        Boolean = 3,
        List = 4,
        Map = 5,
        Date = 6,
        Duration = 7,
    }
}