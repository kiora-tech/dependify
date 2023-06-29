# 🚀 Dependify

`Dependify` is your trusty sidekick for generating and installing your Symfony dependencies on GitLab. We take care of your dependency woes, allowing you to focus on crafting amazing things with Symfony. 🏗️🔧

## 🛠️ Installation

### Bash Script `install.sh`

1. Make sure you have `jq` and `curl` installed on your machine. If not, you can install them with the following commands:

```bash
sudo apt update
sudo apt install curl jq
```

2. Copy the `install.sh` script into your project.
3. The script uses the following variables:
   - `TOKEN`: Your GitLab API access token, stored as `GITLAB_TOKEN` in your environment variables. Make sure to set this on your server before running the script.
   - `PROJECT_ID`: Your GitLab project ID. This is passed as an argument when running the script.
   - `PROJECT_PATH`: The path where you want your project installed. This is also passed as an argument.

```bash
# Usage: ./install.sh PROJECT_ID PROJECT_PATH
```

4. Run the script on your server with the following command:
```bash
bash install.sh YOUR_PROJECT_ID YOUR_PROJECT_PATH
```

_**Note:** The script must be run on the server where you want to install your project._

### `.gitlab-ci.yml` File

1. Copy the `.gitlab-ci.yml` file into the root directory of your project.
2. Ensure you've set your environment variables in GitLab. You can do this by going to `Settings` > `CI/CD` > `Variables`.

## 💡 Usage Tips

`Dependify` is like a versatile multi-tool 🛠️, always ready to help but works best when handled with care. Remember to make regular and meaningful commits to get the most out of your CI/CD pipeline.

And above all, remember to have fun! `Dependify` is here to make your work easier, not harder. So, relax, grab a coffee ☕, and let `Dependify` handle your dependencies.

## 🚧 Contributing

We love contributions! If you have an idea for improving `Dependify`, don't hesitate to open an issue or submit a pull request.

## 📃 License

`Dependify` is open source and is distributed under the MIT license. You are free to use it, modify it, and redistribute it.

---

That's it! Start crafting amazing things with Symfony and GitLab, and let `Dependify` take care of the rest. 🚀🌟
