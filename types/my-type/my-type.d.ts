declare module "~my-type/index" {
  export type MyType = {
    s: string;
  };
}

declare module "my-type" {
  import alias = require("~my-type/index");
  export = alias;
}
