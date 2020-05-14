package objects;

import physics.DiagonalMovement.InitialDirection;
import physics.MovementPhysics.MovementType;
import utils.CollisionSystem;
import components.RigidBody;
import components.SimpleCollider;
import components.Sprite;
import components.WallCollider;

class Ball extends GameObject {
    private function new(scene: h2d.Scene, ?x: Int = 0, ?y: Int = 0) {
        super(scene, x, y);
    }

    public static function create<T>(scene: h2d.Scene, ?x: Int = 0, ?y: Int = 0, initialDeltas: InitialDirection<T>): Ball {
        var ball = new Ball(scene, x, y);
        var rigidBody = new RigidBody(ball, MovementType.Diagonal(initialDeltas));
        var sprite = new Sprite(ball, 10);
        var collider = new SimpleCollider(ball);
        var wallCollider = new WallCollider(ball);
        var components = new List<components.IComponent>();
        components.push(rigidBody);
        components.push(sprite);
        components.push(collider);
        components.push(wallCollider);
        ball.addComponents(components);
        return ball;
    }
}