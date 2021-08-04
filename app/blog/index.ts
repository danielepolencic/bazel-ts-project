import {readMd, readSvg} from './report-2021q1/report-2021q1'

export function runBlog() {
  console.log(readMd())
  console.log(readSvg())
}
