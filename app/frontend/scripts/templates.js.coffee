window.templates = []

templates.results = """

  <div class="results">
    {{#results}}
      {{>row}}
    {{/results}}
  </div>
"""

templates.row = """

  <div class="row">
    <a href="http://reddit.com{{permalink}}">{{title}}</a>
  </div>
"""