import { b } from "@libs/b";
import * as Hast from "hast";

let d: Hast.Element | undefined;
d = { type: "root", properties: {}, tagName: "div" };

export const a = `a${b} ${JSON.stringify(d)}`;
