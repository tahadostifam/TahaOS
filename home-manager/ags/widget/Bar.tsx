import { Variable } from "astal"
import { App, Astal, Gtk, Gdk } from "astal/gtk3"
import Hyprland from "gi://AstalHyprland"

const hyprland = Hyprland.get_default()

const time = Variable("").poll(1000, "date")

export default function Bar(gdkmonitor: Gdk.Monitor) {
    for (const client of hyprland.get_clients()) {
        print(client.title)
    }

    const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

    return <window
        className="Bar"
        gdkmonitor={gdkmonitor}
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        anchor={TOP | LEFT | RIGHT}
        application={App}>
        <centerbox>

            <button
                onClicked="echo hello"
                halign={Gtk.Align.CENTER}
            >
                Welcome
            </button>
            <box />
            <button
                onClicked="notify-send hiiii"
                halign={Gtk.Align.CENTER}
            >
                <label label={time()} />
            </button>

            <button
                onClicked="notify-send hiiii"
                halign={Gtk.Align.CENTER}
            >

            </button>


        </centerbox>
    </window>
}
