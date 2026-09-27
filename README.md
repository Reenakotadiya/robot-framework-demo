# Robot Framework Automation Demo

[![Robot Tests](https://github.com/Reenakotadiya/robot-framework-demo/actions/workflows/tests.yml/badge.svg)](https://github.com/Reenakotadiya/robot-framework-demo/actions/workflows/tests.yml)

A **keyword-driven test automation project** built with **Robot Framework**, covering both **UI testing** (SeleniumLibrary) and **REST API testing** (RequestsLibrary).

- **UI tests** run against the demo shop [SauceDemo](https://www.saucedemo.com/): login, cart and checkout
- **API tests** run against [JSONPlaceholder](https://jsonplaceholder.typicode.com/): GET, POST, PUT, DELETE and error handling

---

## ✨ Features

- **Keyword-driven design**: readable, business-style test steps
- **Page Object pattern with resource files**: locators and keywords per page in `resources/`
- **Data-driven tests**: negative login cases use a `[Template]` table
- **UI and API testing** in one project
- **Tags**: run `smoke`, `regression` or `api` tests separately
- **Screenshots on failure**: captured automatically
- **Built-in HTML reports**: `report.html` and `log.html` after every run
- **CI/CD**: tests run on GitHub Actions in headless Chrome for every push

---

## 📁 Project Structure

```
robot-framework-demo/
├── resources/                    # Reusable keywords and locators
│   ├── common.resource           # Browser setup, test data, login
│   ├── login_page.resource
│   ├── products_page.resource
│   ├── checkout_page.resource
│   └── api.resource              # API session setup
├── tests/
│   ├── ui/
│   │   ├── login.robot
│   │   ├── cart.robot
│   │   └── checkout.robot
│   └── api/
│       └── posts.robot
├── requirements.txt
└── .github/workflows/tests.yml   # GitHub Actions pipeline
```

---

## 🧪 Test Coverage

| Suite | Scenario | Tag |
|---|---|---|
| UI · Login | Valid login opens the Products page | smoke |
| UI · Login | Locked user, wrong password, empty username, empty password (data-driven) | regression |
| UI · Cart | Adding a product updates the cart badge | smoke |
| UI · Cart | Removing a product clears the cart badge | regression |
| UI · Cart | Cart lists all added products | regression |
| UI · Checkout | Complete order end to end | smoke |
| UI · Checkout | First name is required | regression |
| API · Posts | GET single post returns correct data | smoke |
| API · Posts | GET all posts returns 100 items | regression |
| API · Posts | POST creates a post (201) | smoke |
| API · Posts | PUT updates a post | regression |
| API · Posts | DELETE removes a post | regression |
| API · Posts | Missing post returns 404 | regression |

---

## 🚀 How to Run

**1. Clone and install**

```bash
git clone https://github.com/Reenakotadiya/robot-framework-demo.git
cd robot-framework-demo
pip install -r requirements.txt
```

**2. Run tests**

```bash
robot --outputdir results tests                              # all tests
robot --outputdir results --include smoke tests              # smoke tests only
robot --outputdir results tests/api                          # API tests only
robot --outputdir results --variable BROWSER:headlesschrome tests   # no browser window
```

**3. View the report**

Open `results/report.html` or `results/log.html` in your browser.

---

## 🛠️ Tech Stack

Robot Framework · SeleniumLibrary · RequestsLibrary · Python · GitHub Actions

---

## 👩‍💻 Author

**Reena Kotadiya**, QA Automation Engineer

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Reena%20Kotadiya-0A66C2?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/reena-kotadiya-1a7073170)
