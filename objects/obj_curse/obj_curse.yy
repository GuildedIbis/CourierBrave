{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "obj_curse",
  "eventList": [
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":8,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":1,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":2,"eventType":3,"isDnD":false,},
  ],
  "managed": true,
  "overriddenProperties": [
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_fragment","path":"objects/obj_fragment/obj_fragment.yy",},"propertyId":{"name":"deteriorate_after","path":"objects/obj_fragment/obj_fragment.yy",},"value":"3600",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_fragment","path":"objects/obj_fragment/obj_fragment.yy",},"propertyId":{"name":"bounce_count","path":"objects/obj_fragment/obj_fragment.yy",},"value":"0",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_entity","path":"objects/obj_entity/obj_entity.yy",},"propertyId":{"name":"hit_script","path":"objects/obj_entity/obj_entity.yy",},"value":"EntityHitDestroy",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_entity","path":"objects/obj_entity/obj_entity.yy",},"propertyId":{"name":"entity_create","path":"objects/obj_entity/obj_entity.yy",},"value":"CurseStoneCreate",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_entity","path":"objects/obj_entity/obj_entity.yy",},"propertyId":{"name":"activate_script","path":"objects/obj_entity/obj_entity.yy",},"value":"CurseStoneStep",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_entity","path":"objects/obj_entity/obj_entity.yy",},"propertyId":{"name":"fragment_count","path":"objects/obj_entity/obj_entity.yy",},"value":"3",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_entity","path":"objects/obj_entity/obj_entity.yy",},"propertyId":{"name":"fragment","path":"objects/obj_entity/obj_entity.yy",},"value":"obj_fragStone_curse",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_entity","path":"objects/obj_entity/obj_entity.yy",},"propertyId":{"name":"collision","path":"objects/obj_entity/obj_entity.yy",},"value":"True",},
  ],
  "parent": {
    "name": "Interactable",
    "path": "folders/Objects/Entities/Interactable.yy",
  },
  "parentObjectId": {
    "name": "obj_interactable",
    "path": "objects/obj_interactable/obj_interactable.yy",
  },
  "persistent": false,
  "physicsAngularDamping": 0.1,
  "physicsDensity": 0.5,
  "physicsFriction": 0.2,
  "physicsGroup": 1,
  "physicsKinematic": false,
  "physicsLinearDamping": 0.1,
  "physicsObject": false,
  "physicsRestitution": 0.1,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsShapePoints": [],
  "physicsStartAwake": true,
  "properties": [
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"level_unlock","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"-1","varType":0,},
  ],
  "solid": false,
  "spriteId": {
    "name": "spr_curse",
    "path": "sprites/spr_curse/spr_curse.yy",
  },
  "spriteMaskId": null,
  "visible": true,
}