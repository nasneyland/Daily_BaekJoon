import Foundation

func solution(_ letter:String) -> String {
    let morses = [
            ".-": "a", "-...": "b", "-.-.": "c", "-..": "d", ".": "e", "..-.": "f",
            "--.": "g", "....": "h", "..": "i", ".---": "j", "-.-": "k", ".-..": "l",
            "--": "m", "-.": "n", "---": "o", ".--.": "p", "--.-": "q", ".-.": "r",
            "...": "s", "-": "t", "..-": "u", "...-": "v", ".--": "w", "-..-": "x",
            "-.--": "y", "--..": "z"
        ]
    return letter.split(separator: " ").map {morses[String($0),default:""]}.joined()
}