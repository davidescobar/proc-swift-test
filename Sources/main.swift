import Foundation

func runProcess(command: String, _ args: String...) -> Optional<String> {
  let process = Process.launchedProcess(launchPath: command, arguments: args)
  let pipe = Pipe()
  // process.launchPath = command
  // process.arguments = args
  process.standardOutput = pipe

  let data = pipe.fileHandleForReading.readDataToEndOfFile()
  return String(data: data, encoding: String.Encoding.utf8)
}


func main() {
  let output = runProcess(command: "/usr/bin/git", "branch")
  if let output = output {
    let entries = output.characters.split(separator: "\n").map(String.init)
    print("\n")
    for entry in entries {
      print(entry)
    }
    print("\n")
  }
}

main()

