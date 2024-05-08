<div align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://github.com/fly-apps/ollama-open-webui/assets/3727384/25c0bc76-cf50-431d-8435-707fac9c2b1a">
    <img height="100px" src="https://github.com/fly-apps/ollama-open-webui/assets/3727384/5659f0e4-c4c7-4a0a-9949-d8042564be45"</img>
  </picture>
</div>

<div align="center">
  <p>Run <strong><a href="https://github.com/ollama/ollama">Ollama</a></strong> and <strong><a href="https://github.com/open-webui/open-webui">Open WebUI</a></strong> on the same Fly Machine!</p>
</div>

___________

<div align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://github.com/fly-apps/ollama-open-webui/assets/3727384/471dc098-e5f5-4d02-813d-c77fe891bf58">
    <img src="https://github.com/fly-apps/ollama-open-webui/assets/3727384/22e90e1e-7a48-4628-8444-8135a0049adb"</img>
  </picture>
</div>

## Deploy

Everyone loves a one-liner — let's clone the repo and deploy the app with [flyctl](https://fly.io/docs/hands-on/install-flyctl/): 

```bash
fly launch --from https://github.com/fly-apps/ollama-open-webui
```

That's it! When you visit `https://[app].fly.dev` you should see the Open WebUI interface where you can log in and create the initial admin user. You can then optionally disable signups and make the app private by setting `ENABLE_SIGNUP = "false"` in your fly.toml [`env` variables section](https://fly.io/docs/reference/configuration/#the-env-variables-section).

> [!IMPORTANT]  
> By default, the app runs on Fly GPUs — Nvidia L40s to be exact. This can be customized in the fly.toml [`vm` settings](https://github.com/fly-apps/ollama-open-webui/blob/e168239c26fb2548ee26d1e44e1df3ab1278497d/fly.toml#L26). It will _probably_ run on a standard Fly Machine because Ollama does leverage llama.cpp — but performance will be drastically reduced.

## Scaling to Zero

By default, the app does scale-to-zero. This is recommended (especially with GPUs) to save on costs. When the app receives a new request from the proxy, the Machine will boot in ~3s with the Web UI server ready to serve requests in ~15s. Loading models into VRAM can take a bit longer, depending on the size of the model.

## Having trouble?

Create an issue or ask a question here: https://community.fly.io/
