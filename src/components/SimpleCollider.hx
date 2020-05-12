package components;

import utils.Vector2;
import objects.GameObject;
import utils.CollisionSystem;


class SimpleCollider extends Component {

    public function new(attachee: GameObject) {
        super(attachee);
        CollisionSystem.addCollider(this);
    }

    public function collidedWith(collider: SimpleCollider) {
        var rigidBody = cast(this.attachee.getComponent("rigid body"), RigidBody);
        rigidBody.gravity = new Vector2();
        rigidBody.velocity = new Vector2();
    }
}