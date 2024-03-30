controller := 1 ; Controller number
time_before_sleep := 30 * 1000 ; X * 1000 where X = seconds

last_input := 0
buttons := GetKeyState(controller "JoyButtons")

Loop
{
    current_time := A_TickCount

    Loop buttons
    {
        if GetKeyState(controller "Joy" A_Index)
        {
            last_input := current_time
            break
        }
    }

    time_without_input := current_time - last_input

    if time_without_input > time_before_sleep
        SoundSetVolume 0
    else
        SoundSetVolume 100

    Sleep 1
}
