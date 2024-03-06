{
  "$GMObject":"",
  "%Name":"obj_curse",
  "eventList":[
    {"$GMEvent":"","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":8,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":1,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"","%Name":"","collisionObjectId":null,"eventNum":2,"eventType":3,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
  ],
  "managed":true,
  "name":"obj_curse",
  "overriddenProperties":[
    {"$GMOverriddenProperty":"","%Name":"","name":"","objectId":{"name":"obj_fragment","path":"objects/obj_fragment/obj_fragment.yy",},"propertyId":{"name":"deteriorate_after","path":"objects/obj_fragment/obj_fragment.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"3600",},
    {"$GMOverriddenProperty":"","%Name":"","name":"","objectId":{"name":"obj_fragment","path":"objects/obj_fragment/obj_fragment.yy",},"propertyId":{"name":"bounce_count","path":"objects/obj_fragment/obj_fragment.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"0",},
    {"$GMOverriddenProperty":"","%Name":"","name":"","objectId":{"name":"obj_entity","path":"objects/obj_entity/obj_entity.yy",},"propertyId":{"name":"hit_script","path":"objects/obj_entity/obj_entity.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"scr_entity_hit",},
    {"$GMOverriddenProperty":"","%Name":"","name":"","objectId":{"name":"obj_entity","path":"objects/obj_entity/obj_entity.yy",},"propertyId":{"name":"entity_create","path":"objects/obj_entity/obj_entity.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"CurseStoneCreate",},
    {"$GMOverriddenProperty":"","%Name":"","name":"","objectId":{"name":"obj_entity","path":"objects/obj_entity/obj_entity.yy",},"propertyId":{"name":"activate_script","path":"objects/obj_entity/obj_entity.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"CurseStoneStep",},
    {"$GMOverriddenProperty":"","%Name":"","name":"","objectId":{"name":"obj_entity","path":"objects/obj_entity/obj_entity.yy",},"propertyId":{"name":"fragment_count","path":"objects/obj_entity/obj_entity.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"3",},
    {"$GMOverriddenProperty":"","%Name":"","name":"","objectId":{"name":"obj_entity","path":"objects/obj_entity/obj_entity.yy",},"propertyId":{"name":"fragment","path":"objects/obj_entity/obj_entity.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"obj_fragStone_curse",},
    {"$GMOverriddenProperty":"","%Name":"","name":"","objectId":{"name":"obj_entity","path":"objects/obj_entity/obj_entity.yy",},"propertyId":{"name":"collision","path":"objects/obj_entity/obj_entity.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"True",},
  ],
  "parent":{
    "name":"Interactable",
    "path":"folders/Objects/Entities/Interactable.yy",
  },
  "parentObjectId":{
    "name":"obj_interactable",
    "path":"objects/obj_interactable/obj_interactable.yy",
  },
  "persistent":false,
  "physicsAngularDamping":0.1,
  "physicsDensity":0.5,
  "physicsFriction":0.2,
  "physicsGroup":1,
  "physicsKinematic":false,
  "physicsLinearDamping":0.1,
  "physicsObject":false,
  "physicsRestitution":0.1,
  "physicsSensor":false,
  "physicsShape":1,
  "physicsShapePoints":[],
  "physicsStartAwake":true,
  "properties":[
    {"$GMObjectProperty":"","%Name":"level_unlock","filters":[],"listItems":[],"multiselect":false,"name":"level_unlock","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"-1","varType":0,},
    {"$GMObjectProperty":"","%Name":"camp_unlock","filters":[],"listItems":[],"multiselect":false,"name":"camp_unlock","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"-1","varType":0,},
  ],
  "resourceType":"GMObject",
  "resourceVersion":"2.0",
  "solid":false,
  "spriteId":{
    "name":"spr_curse",
    "path":"sprites/spr_curse/spr_curse.yy",
  },
  "spriteMaskId":null,
  "visible":true,
}