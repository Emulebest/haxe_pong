package objects;

import physics.MovementPhysics.MovementType;
import utils.CollisionSystem;
import components.RigidBody;
import components.SimpleCollider;
import components.Sprite;

class Square extends GameObject {
    private function new(scene: h2d.Scene, ?x: Int = 0, ?y: Int = 0) {
        super(scene, x, y);
    }

    public static function create(scene: h2d.Scene, ?x: Int = 0, ?y: Int = 0, gravityAffected: Bool): Square {
        var square = new Square(scene, x, y);
        var rigidBody = new RigidBody(square, MovementType.Gravity(gravityAffected));
        var sprite = new Sprite(square, 60);
        var collider = new SimpleCollider(square);
        var components = new List<components.IComponent>();
        components.push(rigidBody);
        components.push(sprite);
        components.push(collider);
        square.addComponents(components);
        return square;
    }
}