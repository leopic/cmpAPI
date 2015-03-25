var express = require('express');
var router = express.Router();
var _ = require('underscore');
var cors = require('cors');

// DB en memoria
var marcas = ["Volkswagen", "Nissan", "Toyota", "Honda", "Hyundai", "Lexus", "Mitsubishi"],
    modelos = ["Crossfox", "Tida", "Corolla", "Accord", "Accent", "Yaris", "Beetle", "Amarok", "Lancer"];
var carros = [];
_.times(5, function() {
    _.each(marcas, function(marca) {
        carros.push({
            "id": carros.length + 1,
            "marca": marca,
            "modelo": _.sample(modelos)
        });
    });
});

var _buscarPorId = function(id) {
    return _.find(carros, function(carro) {
        return carro.id == id;
    });
}

// GET lista
router.get('/', cors(), function(req, res) {
    res.status(200).send(carros);
});

// GET unico
router.get('/:id', cors(), function(req, res) {
    var carro = _buscarPorId(req.params.id);
    carro ? res.send(carro) : res.sendStatus(404);
});

module.exports = router;
