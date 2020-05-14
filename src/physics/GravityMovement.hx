package physics;

import components.Sprite;
import utils.Vector2;

class GravityMovement implements MovementPhysics {
    var gravityAttached: Bool;
    var velocity: Vector2;
    var gravity: Vector2;

    public function new(gravityAttached: Bool) {
        this.gravityAttached = gravityAttached;
        velocity = new Vector2();
        gravity = new Vector2();
        gravity.y = 10;
    }

    public function invertMovement(): Void {
        
    }

    public function update(dt: Float, sprite: Sprite) {
        sprite.bitmap.x += velocity.x * dt;
        sprite.bitmap.y += velocity.y * dt;
        if (gravityAttached) {
            velocity.x += gravity.x * dt;
            velocity.y += gravity.y * dt;
        }
    }

    public function stop() {
        gravity = new Vector2();
        velocity = new Vector2();
    }
}