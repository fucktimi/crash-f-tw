import json,os

class mod:
    def response(self,flow):
        if flow.request.url.startswith("https://52.198.179.228/v88/unit/list"):
            with open('/crashfever/unit/unit-list.json','rb') as f:
                res = json.load(f)

            flow.response.set_text(json.dumps(res))

addons = [
    mod()
]