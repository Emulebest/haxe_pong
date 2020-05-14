package components;

import h2d.Tile;
import h2d.Bitmap;
import objects.GameObject;

class Sprite extends Component {
    public var bitmap: Bitmap;

    public function new(attachee: GameObject, size: Int) {
        super(attachee);
        type = "sprite";
        bitmap = new Bitmap(Tile.fromColor(0xFF0000, size, size));
        bitmap.setPosition(attachee.object.x, attachee.object.y);
        attachee.scene.addChild(bitmap);
    }
}