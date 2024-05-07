<div align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://github.com/fly-apps/ollama-open-webui/assets/3727384/25c0bc76-cf50-431d-8435-707fac9c2b1a">
    <img height="100px" src="https://github.com/fly-apps/ollama-open-webui/assets/3727384/5659f0e4-c4c7-4a0a-9949-d8042564be45"
  </picture>
</div>

<div align="center">
  <p>Run <strong><a href="https://github.com/ollama/ollama">Ollama</a></strong> and <strong><a href="https://github.com/open-webui/open-webui">Open WebUI</a></strong> on the same Fly Machine!</p>
</div>

___________

<div align="center">
  <img width="100%" alt="cover" src="https://github.com/fly-apps/ollama-webui-demo/assets/3727384/23b87769-ccde-46b9-a884-72c174a49f02">
</div>



## Deploy

Everyone loves a one-liner — let's clone the repo and deploy app with [flyctl](https://fly.io/docs/hands-on/install-flyctl/): 

```bash
fly launch --from https://github.com/fly-apps/ollama-open-webui
```

That's it! When you visit `https://[app].fly.dev` you should see the Open WebUI interface where you can log in and create the initial admin user. You can then optionally disable signups and make the app private by setting `ENABLE_SIGNUP = "false"` in your [fly.toml](./fly.toml)

## Having trouble?

Create an issue or ask a question here: https://community.fly.io/
