import { exec } from "child_process";

export async function handler(context) {
  const prompt = context.input.toLowerCase();

  if (prompt.includes("run playwright tests")) {
    return new Promise((resolve, reject) => {
      exec("docker compose run --rm tests", (error, stdout, stderr) => {
        if (error) reject(stderr);
        else resolve(stdout);
      });
    });
  }

  return "No matching command found.";
}
