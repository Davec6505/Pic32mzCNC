# Build stopping errors
$FatalErrors = @(
    304,
    324,
    357,
    402,
    438
)

# Display colours
$Colours = @{
    304  = 'Red'
    324  = 'Red'
    357  = 'Red'
    402  = 'Red'
    438  = 'Red'

    1354 = 'Yellow'
    1503 = 'Yellow'
    1505 = 'Yellow'
    1508 = 'Yellow'
    1512 = 'Yellow'
    1163 = 'Yellow'
    1040 = 'Yellow'

    1164 = 'DarkCyan'

    1004 = 'DarkGray'
    1144 = 'DarkGray'

    122  = 'White'

    123  = 'Green'
    125  = 'Green'
    128  = 'Green'
    129  = 'Green'

    127  = 'DarkBlue'
}

$WarningPatterns = @{
    1004 = 'stack overflow|cross-calling|recursion'
}

# Descriptions
$Descriptions = @{
    304  = 'Object filename mismatch'
    324  = 'Compilation failed'
    357  = 'Main function missing'
    402  = 'Syntax error'
    438  = 'Link error'

    1004 = 'Compiler information'
    1040 = 'File not found'

    1163 = 'Unused variable'
    1164 = 'Optimized away'

    1354 = 'Argument out of range'

    1503 = 'Undefined result'
    1505 = 'Pointer conversion'
    1508 = 'Integer to pointer conversion'
    1512 = 'Possibly uninitialized'

    1144 = 'Memory usage'

    122 = 'Compile start'
    123 = 'Compile success'
    125 = 'Link success'
    127 = 'Compile summary'
    128 = 'Link summary'
    129 = 'Build complete'
}