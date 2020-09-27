'use strict';

module.exports = function(app){
    var jsonku = require('./controller');

    app.route('/')
        .get(jsonku.index);

    app.route('/tampilSemua')
        .get(jsonku.tampilSemuaData);

    app.route('/tampilById/:id')
        .get(jsonku.tampilById);
}