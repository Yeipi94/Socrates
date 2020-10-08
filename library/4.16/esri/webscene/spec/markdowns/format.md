# format

The format object can be used with numerical or date fields to provide more detail about how values should be formatted for display.

**Referenced by:** [fieldInfo](fieldInfo.md)

### Properties

| Property | Details
| --- | ---
| dateFormat | A string used with date fields to specify how the date should be formatted.<br>If property is present, must be one of the following values: <ul><li>`dayShortMonthYear`</li><li>`dayShortMonthYearLongTime`</li><li>`dayShortMonthYearLongTime24`</li><li>`dayShortMonthYearShortTime`</li><li>`dayShortMonthYearShortTime24`</li><li>`longDate`</li><li>`longDateLongTime`</li><li>`longDateLongTime24`</li><li>`longDateShortTime`</li><li>`longDateShortTime24`</li><li>`longMonthDayYear`</li><li>`longMonthDayYearLongTime`</li><li>`longMonthDayYearLongTime24`</li><li>`longMonthDayYearShortTime`</li><li>`longMonthDayYearShortTime24`</li><li>`longMonthYear`</li><li>`shortDate`</li><li>`shortDateLE`</li><li>`shortDateLELongTime`</li><li>`shortDateLELongTime24`</li><li>`shortDateLEShortTime`</li><li>`shortDateLEShortTime24`</li><li>`shortDateLongTime`</li><li>`shortDateLongTime24`</li><li>`shortDateShortTime`</li><li>`shortDateShortTime24`</li><li>`shortMonthYear`</li><li>`year`</li></ul>
| digitSeparator | A Boolean used with numerical fields. A value of true allows the number to have a digit (or thousands) separator. Depending on the locale, this separator is a decimal point or a comma. A value of false means that no separator will be used.
| places | An integer used with numerical fields to specify the number of decimal places. Any places beyond this value are rounded.



