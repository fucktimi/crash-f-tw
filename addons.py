import json,os

class mod:
    def response(self,flow):
        if "unit/list" in flow.request.url:
            with open('/crashfever/unit/unit-list.json','rb') as f:
                res = json.load(f)

            flow.response.set_text(json.dumps(res))

addons = [
    mod()
]