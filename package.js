Package.describe({
    name: 'manuel:viewmodel-explorer',
    summary: "Side panel for manuel:viewmodel",
    version: "1.0.2",
    git: "https://github.com/ManuelDeLeon/viewmodel-explorer",
    debugOnly: true
});

Package.onUse(function(api) {
  api.versionsFrom('METEOR@1.0');
  api.use(['jquery', 'templating', 'session'], 'client');
  api.use('coffeescript');
  api.use('underscore');
  api.use('manuel:reactivearray@1.0.3', 'client');
  api.addFiles([
    'client/lib/Client.coffee',
    'client/accordion/jquery-ui.js',
    'client/accordion/jquery-ui.css',
    'client/accordion/jquery-ui.structure.css',
    'client/accordion/jquery-ui.theme.css',
    'client/sidr/sidr.css',
    'client/sidr/sidr.js',
    'client/explorer/section/details/details.css',
    'client/explorer/section/details/details.html',
    'client/explorer/section/details/details.coffee',
    'client/explorer/section/section.html',
    'client/explorer/section/section.coffee',
    'client/explorer/ViewModelExplorer.html',
    'client/explorer/ViewModelExplorer.coffee',
    'client/explorer/ViewModelExplorer.css'
  ], 'client');
});
