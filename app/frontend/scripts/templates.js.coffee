window.templates = []

templates.results = """

  <div class="results">
    {{#results}}
      {{>row}}
    {{/results}}
  </div>
"""

templates.row = """

  <div class="row {{type}}">
    <a href="{{permalink}}" target="_blank">{{title}}</a>
  </div>
"""