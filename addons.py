import json,os

class mod:
    def response(self,flow):
        if flow.request.url.startswith("https://twn-bl.nappers.jp/v88/unit/list"):
            with open('/Users/gzkl/unit-list.json','rb') as f:
                res = json.load(f)

            flow.response.set_text(json.dumps(res))

addons = [
    mod()
]