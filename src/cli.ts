#!/usr/bin/env node

import { create } from "create-create-app";
import { resolve } from "path";
import config from "./config.json";
import fs from "fs/promises";
import path from "path";
const templateRoot = resolve(__dirname, "..", "templates");

// See https://github.com/uetchy/create-create-app/blob/master/README.md for other options.
var updateConf = async (name: string, answers: any) => {
  var { debugPort } = answers;
  var filePath = path.join(
    __dirname,
    "../../create-fullstack-app/src/config.json"
  );
  var config = await fs.readFile(filePath, "utf-8");
  var configObj = JSON.parse(config);
  configObj.nextDebugPort = Number.parseInt(debugPort) + 1;
  await fs.writeFile(filePath, JSON.stringify(configObj, null, 4));
};

create("create-fullstack-app", {
  templateRoot,
  skipGitInit: true,
  promptForLicense: false,
  defaultDescription: "",
  extra: {
    scope: {
      type: "input",
      describe: "author npm scope",
      prompt: "if-no-arg",
    },
    debugPort: {
      type: "input",
      describe: "ui debug port",
      default: config.nextUIDebugPort,
      prompt: "if-no-arg",
    },
    backendDebugPort: {
      type: "input",
      describe: "backend debug port",
      default: config.nextBackendDebugPort,
      prompt: "if-no-arg",
    },
    appType: {
      type: "input",
      describe: "role",
      default: "app",
      prompt: "if-no-arg",
    },
    baseRoute: {
      type: "input",
      describe: "base route. defaults to app name",
      default: `/${process.argv[2]}`,
      prompt: "if-no-arg",
    },
    backendRootUrl: {
      type: "input",
      describe: "backend root url. defaults to /api",
      default: `/api`,
      prompt: "if-no-arg",
    },
  },
  after: async ({ answers, name }) => {
    await updateConf(name, answers);
  },
});
