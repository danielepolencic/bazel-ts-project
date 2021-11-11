import MyType from "my-type";
import Hast from "hast";

let d: Hast.Element | undefined;
d = { type: "root", properties: {}, tagName: "div" };
JSON.stringify(d);
const c: MyType.MyType = { s: "string" };
export const b = `b ${JSON.stringify(c)} `;
