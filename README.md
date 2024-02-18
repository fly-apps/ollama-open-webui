<div align="center">
  <h1>Ollama + Open WebUI</h1>
</div>

<div align="center">
  <img width="100%" alt="cover" src="https://github.com/fly-apps/ollama-webui-demo/assets/3727384/23b87769-ccde-46b9-a884-72c174a49f02">
</div>

A demo running [Ollama](https://github.com/ollama/ollama) and [Open WebUI](https://github.com/open-webui/open-webui) on the same Fly Machine!

## Deploy

```bash
fly apps create [app_name]
fly deploy
```

That's it! When you visit `https://[app].fly.dev` you should see the Open WebUI interface where you can log in and create the initial admin user.
