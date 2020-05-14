package components;

import objects.GameObject;

class WallCollider extends Component {

    public function new(attachee: GameObject) {
        super(attachee);
    }

    public override function update(dt: Float) {
        var sprite = cast(this.attachee.getComponent("sprite"), Sprite);
        var rigidBody = cast(this.attachee.getComponent("rigid body"), RigidBody);
        if (sprite.bitmap.y >= attachee.scene.height || sprite.bitmap.y <= 0) {
            rigidBody.invertMovement();
        }
        if (sprite.bitmap.x >= attachee.scene.width || sprite.bitmap.x <= 0) {
            rigidBody.stop();
        }
    }
}