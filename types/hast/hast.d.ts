declare module "~hast/index" {
  export interface Element {
    type: string;
    tagName: string;
    properties: Record<string, unknown>;
  }
}

declare module "hast" {
  import alias = require("~hast/index");
  export = alias;
}
