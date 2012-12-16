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
    <a href="{{permalink}}">{{title}}</a>
  </div>
"""