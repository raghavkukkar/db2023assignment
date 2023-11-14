const inquirer = require("inquirer");

function inputQ(name, message) {
  return {
    type: "input",
    name,
    message
  };
}

function passQ(name, message) {
  return {
    type: "password",
    name,
    message
  };
}

const functionToProcedureMap = {
  addUser: async function () {
    console.clear();
    const userInfo = await inquirer.prompt([
      inputQ("employeeId", "employee id for new user"),
      passQ("password", "enter new password for new user")
    ]);
  }
};

const roleFunctionMap = {
  admin: [
    "addUser",
    "addVehicle",
    "addEmployee",
    "addCustomer",
    "modifyCustomer",
    "modifyVehicle",
    "addCustomerVehicle",
    "modifyCustomerVehicle",
    "modifyVehicle",
    "addSparePart",
    "addSparePartInventory",
    "addAppointment",
    "modifyAppointment",
    "generateBill",
    "assignSparePart",
    "viewVehicle",
    "viewSelf",
    "viewEmployee",
    "viewCustomer",
    "viewCustomerVehicle",
    "viewAppointment"
  ]
};

function getAvailableFunction(role) {
  return roleFunctionMap[role];
}

async function mainWindow() {
  console.clear();
  const { mainAnswer } = await inquirer.prompt({
    type: "list",
    choices: ["login", "exit"],
    name: "mainAnswer",
    message: "Hello Welcome to managment cli .Login to continue"
  });
  return mainAnswer;
}

async function validateLogin(userName, password) {
  return { role: "admin" };
}

async function LoginWindow() {
  console.clear();
  const { userName, password } = await inquirer.prompt([
    {
      type: "input",
      name: "userName",
      message: "enter userName"
    },
    {
      type: "password",
      name: "password",
      message: "enter password"
    }
  ]);
  return { userName, password };
}

async function mainFunctionalScreen(role) {
  console.clear();
  const { choice } = await inquirer.prompt({
    type: "list",
    name: "choice",
    choices: getAvailableFunction(role)
  });
  if (functionToProcedureMap[choice]) await functionToProcedureMap[choice]();
}

async function main() {
  const loginOrExit = await mainWindow();
  if (loginOrExit === "login") {
    const { userName, password } = await LoginWindow();
    const { role } = await validateLogin(userName, password);
    if (!role) {
      console.log(
        `EITHER YOU ARE NOT A USER OR WE ARE FACING SOME ISSUE. TRY AGAIN`
      );
      process.exit(1);
    }
    await mainFunctionalScreen(role);
  } else {
    process.exit(0);
  }
}

main();
