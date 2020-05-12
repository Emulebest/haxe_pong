package components;

import utils.Vector2;
import objects.GameObject;

class RigidBody extends Component {
    public var velocity: Vector2;
    public var gravity: Vector2;
    var gravityAttached: Bool;


    public function new(attachee: GameObject, ?gravityAttached: Bool = false) {
        super(attachee);
        type = "rigid body";
        velocity = new Vector2();
        gravity = new Vector2();
        gravity.y = 10;
        this.gravityAttached = gravityAttached;
    }

    public override function update(dt: Float) {
        var sprite = cast(this.attachee.getComponent("sprite"), Sprite);
        sprite.bitmap.x += velocity.x * dt;
        sprite.bitmap.y += velocity.y * dt;
        if (gravityAttached) {
            velocity.x += gravity.x * dt;
            velocity.y += gravity.y * dt;
        }
    }
}