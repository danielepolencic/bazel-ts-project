import { readFileSync } from "fs";
import { join } from "path";

export function readMd() {
  try {
    return readFileSync(join(__dirname, "content.md"));
  } catch (error) {
    console.log(error.message);
  }
}

export function readSvg() {
  try {
    return readFileSync(join(__dirname, "assets/years-of-experience.svg"));
  } catch (error) {
    console.log(error.message);
  }
}
