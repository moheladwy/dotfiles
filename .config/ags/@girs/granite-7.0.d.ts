/// <reference path="./gdk-4.0.d.ts" />
/// <reference path="./cairo-1.0.d.ts" />
/// <reference path="./gobject-2.0.d.ts" />
/// <reference path="./glib-2.0.d.ts" />
/// <reference path="./pangocairo-1.0.d.ts" />
/// <reference path="./pango-1.0.d.ts" />
/// <reference path="./harfbuzz-0.0.d.ts" />
/// <reference path="./freetype2-2.0.d.ts" />
/// <reference path="./gio-2.0.d.ts" />
/// <reference path="./gmodule-2.0.d.ts" />
/// <reference path="./gdkpixbuf-2.0.d.ts" />
/// <reference path="./gtk-4.0.d.ts" />
/// <reference path="./gsk-4.0.d.ts" />
/// <reference path="./graphene-1.0.d.ts" />
/// <reference path="./gee-0.8.d.ts" />

/**
 * Type Definitions for Gjs (https://gjs.guide/)
 *
 * These type definitions are automatically generated, do not edit them by hand.
 * If you found a bug fix it in `ts-for-gir` or create a bug report on https://github.com/gjsify/ts-for-gir
 *
 * The based EJS template file is used for the generated .d.ts file of each GIR module like Gtk-4.0, GObject-2.0, ...
 */

declare module 'gi://Granite?version=7.0' {
    // Module dependencies
    import type Gdk from 'gi://Gdk?version=4.0';
    import type cairo from 'gi://cairo?version=1.0';
    import type GObject from 'gi://GObject?version=2.0';
    import type GLib from 'gi://GLib?version=2.0';
    import type PangoCairo from 'gi://PangoCairo?version=1.0';
    import type Pango from 'gi://Pango?version=1.0';
    import type HarfBuzz from 'gi://HarfBuzz?version=0.0';
    import type freetype2 from 'gi://freetype2?version=2.0';
    import type Gio from 'gi://Gio?version=2.0';
    import type GModule from 'gi://GModule?version=2.0';
    import type GdkPixbuf from 'gi://GdkPixbuf?version=2.0';
    import type Gtk from 'gi://Gtk?version=4.0';
    import type Gsk from 'gi://Gsk?version=4.0';
    import type Graphene from 'gi://Graphene?version=1.0';
    import type Gee from 'gi://Gee?version=0.8';

    export namespace Granite {
        // Workaround
        /** @ignore */
        export module GraniteServicesSettingsSerializable {
            export interface ConstructorProps extends ServicesSettingsSerializable.ConstructorProps {}
        }
        /** @ignore */
        export interface GraniteServicesSettingsSerializable extends ServicesSettingsSerializable {}
        /**
         * Granite-7.0
         */

        class ServicesContractorError extends GLib.Error {
            static $gtype: GObject.GType<ServicesContractorError>;

            // Static fields

            static SERVICE_NOT_AVAILABLE: number;

            // Constructors

            constructor(options: { message: string; code: number });
            _init(...args: any[]): void;
        }

        export namespace SettingsPageStatusType {
            export const $gtype: GObject.GType<SettingsPageStatusType>;
        }

        enum SettingsPageStatusType {
            ERROR,
            OFFLINE,
            SUCCESS,
            WARNING,
            NONE,
        }

        export namespace SettingsColorScheme {
            export const $gtype: GObject.GType<SettingsColorScheme>;
        }

        enum SettingsColorScheme {
            NO_PREFERENCE,
            DARK,
            LIGHT,
        }

        export namespace ToastDismissReason {
            export const $gtype: GObject.GType<ToastDismissReason>;
        }

        enum ToastDismissReason {
            EXPIRED,
            CLOSED,
            WITHDRAWN,
        }
        const SettingsUriLOCATION: string;
        const SettingsUriONLINE_ACCOUNTS: string;
        const SettingsUriNETWORK: string;
        const SettingsUriPERMISSIONS: string;
        const SettingsUriNOTIFICATIONS: string;
        const SettingsUriSOUND_INPUT: string;
        const SettingsUriSHORTCUTS: string;
        const STYLE_CLASS_ACCENT: string;
        const STYLE_CLASS_BACK_BUTTON: string;
        const STYLE_CLASS_BACKGROUND: string;
        const STYLE_CLASS_BADGE: string;
        const STYLE_CLASS_CARD: string;
        const STYLE_CLASS_CHECKERBOARD: string;
        const STYLE_CLASS_CIRCULAR: string;
        const STYLE_CLASS_COLOR_BUTTON: string;
        const STYLE_CLASS_DEFAULT_DECORATION: string;
        const STYLE_CLASS_DESTRUCTIVE_ACTION: string;
        const STYLE_CLASS_DIALOG_CONTENT_AREA: string;
        const STYLE_CLASS_FRAME: string;
        const STYLE_CLASS_H1_LABEL: string;
        const STYLE_CLASS_H2_LABEL: string;
        const STYLE_CLASS_H3_LABEL: string;
        const STYLE_CLASS_H4_LABEL: string;
        const STYLE_CLASS_KEYCAP: string;
        const STYLE_CLASS_LARGE_ICONS: string;
        const STYLE_CLASS_MODE_SWITCH: string;
        const STYLE_CLASS_OSD: string;
        const STYLE_CLASS_ROUNDED: string;
        const STYLE_CLASS_SIDEBAR: string;
        const STYLE_CLASS_SMALL_LABEL: string;
        const STYLE_CLASS_SUCCESS: string;
        const STYLE_CLASS_TERMINAL: string;
        const STYLE_CLASS_TITLE_LABEL: string;
        const STYLE_CLASS_WARMTH: string;
        const STYLE_CLASS_TEMPERATURE: string;
        const STYLE_CLASS_LINKED: string;
        const STYLE_CLASS_MENU: string;
        const STYLE_CLASS_MENUITEM: string;
        const STYLE_CLASS_DIM_LABEL: string;
        const STYLE_CLASS_ERROR: string;
        const STYLE_CLASS_FLAT: string;
        const STYLE_CLASS_MESSAGE_DIALOG: string;
        const STYLE_CLASS_RICH_LIST: string;
        const STYLE_CLASS_SUGGESTED_ACTION: string;
        const STYLE_CLASS_VIEW: string;
        const STYLE_CLASS_WARNING: string;
        const TRANSITION_DURATION_CLOSE: number;
        const TRANSITION_DURATION_IN_PLACE: number;
        const TRANSITION_DURATION_OPEN: number;
        const TOOLTIP_SECONDARY_TEXT_MARKUP: string;
        function date_time_get_default_time_format(is_12h: boolean, with_second: boolean): string;
        function date_time_get_relative_datetime(date_time: GLib.DateTime): string;
        function date_time_is_same_day(day1: GLib.DateTime, day2: GLib.DateTime): boolean;
        function date_time_get_default_date_format(
            with_weekday: boolean,
            with_day: boolean,
            with_year: boolean,
        ): string;
        function date_time_seconds_to_time(seconds: number): string;
        function services_application_set_badge(count: number): Promise<boolean>;
        function services_application_set_badge(count: number, _callback_: Gio.AsyncReadyCallback<number> | null): void;
        function services_application_set_badge(
            count: number,
            _callback_?: Gio.AsyncReadyCallback<number> | null,
        ): Promise<boolean> | void;
        function services_application_set_badge_finish(_res_: Gio.AsyncResult): boolean;
        function services_application_set_badge_visible(visible: boolean): Promise<boolean>;
        function services_application_set_badge_visible(
            visible: boolean,
            _callback_: Gio.AsyncReadyCallback<boolean> | null,
        ): void;
        function services_application_set_badge_visible(
            visible: boolean,
            _callback_?: Gio.AsyncReadyCallback<boolean> | null,
        ): Promise<boolean> | void;
        function services_application_set_badge_visible_finish(_res_: Gio.AsyncResult): boolean;
        function services_application_set_progress(progress: number): Promise<boolean>;
        function services_application_set_progress(
            progress: number,
            _callback_: Gio.AsyncReadyCallback<number> | null,
        ): void;
        function services_application_set_progress(
            progress: number,
            _callback_?: Gio.AsyncReadyCallback<number> | null,
        ): Promise<boolean> | void;
        function services_application_set_progress_finish(_res_: Gio.AsyncResult): boolean;
        function services_application_set_progress_visible(visible: boolean): Promise<boolean>;
        function services_application_set_progress_visible(
            visible: boolean,
            _callback_: Gio.AsyncReadyCallback<boolean> | null,
        ): void;
        function services_application_set_progress_visible(
            visible: boolean,
            _callback_?: Gio.AsyncReadyCallback<boolean> | null,
        ): Promise<boolean> | void;
        function services_application_set_progress_visible_finish(_res_: Gio.AsyncResult): boolean;
        function widgets_utils_set_color_primary(
            window: Gtk.Widget,
            color: Gdk.RGBA,
            priority: number,
        ): Gtk.CssProvider | null;
        function init(): void;
        function accel_to_string(accel?: string | null): string;
        function markup_accel_tooltip(accels?: string[] | null, description?: string | null): string;
        function contrasting_foreground_color(bg_color: Gdk.RGBA): Gdk.RGBA;
        module ServicesContractorProxy {
            // Signal callback interfaces

            interface ContractsChanged {
                (): void;
            }

            // Constructor properties interface

            interface ConstructorProps extends GObject.Object.ConstructorProps {}
        }

        class ServicesContractorProxy extends GObject.Object {
            static $gtype: GObject.GType<ServicesContractorProxy>;

            // Constructors

            constructor(properties?: Partial<ServicesContractorProxy.ConstructorProps>, ...args: any[]);

            _init(...args: any[]): void;

            // Signals

            connect(id: string, callback: (...args: any[]) => any): number;
            connect_after(id: string, callback: (...args: any[]) => any): number;
            emit(id: string, ...args: any[]): void;
            connect(signal: 'contracts-changed', callback: (_source: this) => void): number;
            connect_after(signal: 'contracts-changed', callback: (_source: this) => void): number;
            emit(signal: 'contracts-changed'): void;

            // Static methods

            static get_instance(): ServicesContractorProxy;
            static get_all_contracts(): Gee.List;
            static get_contracts_by_mime(mime_type: string): Gee.List;
            static get_contracts_by_mimelist(mime_types: string[]): Gee.List;
            static get_contracts_for_file(file: Gio.File): Gee.List;
            static get_contracts_for_files(files: Gio.File[]): Gee.List;
        }

        module ServicesSystem {
            // Constructor properties interface

            interface ConstructorProps extends GObject.Object.ConstructorProps {}
        }

        class ServicesSystem extends GObject.Object {
            static $gtype: GObject.GType<ServicesSystem>;

            // Constructors

            constructor(properties?: Partial<ServicesSystem.ConstructorProps>, ...args: any[]);

            _init(...args: any[]): void;

            static ['new'](): ServicesSystem;

            // Static methods

            static history_is_enabled(): boolean;
        }

        module SettingsPage {
            // Constructor properties interface

            interface ConstructorProps extends Gtk.Box.ConstructorProps {
                status_type: SettingsPageStatusType;
                statusType: SettingsPageStatusType;
                display_widget: Gtk.Widget;
                displayWidget: Gtk.Widget;
                header: string;
                status: string;
                icon_name: string;
                iconName: string;
                title: string;
                child: Gtk.Widget;
            }
        }

        abstract class SettingsPage extends Gtk.Box {
            static $gtype: GObject.GType<SettingsPage>;

            // Properties

            get status_type(): SettingsPageStatusType;
            set status_type(val: SettingsPageStatusType);
            get statusType(): SettingsPageStatusType;
            set statusType(val: SettingsPageStatusType);
            get display_widget(): Gtk.Widget;
            get displayWidget(): Gtk.Widget;
            get header(): string;
            get status(): string;
            set status(val: string);
            get icon_name(): string;
            set icon_name(val: string);
            get iconName(): string;
            set iconName(val: string);
            get title(): string;
            set title(val: string);
            get child(): Gtk.Widget;
            set child(val: Gtk.Widget);

            // Constructors

            constructor(properties?: Partial<SettingsPage.ConstructorProps>, ...args: any[]);

            _init(...args: any[]): void;

            // Methods

            get_status_type(): SettingsPageStatusType;
            set_status_type(value: SettingsPageStatusType | null): void;
            get_display_widget(): Gtk.Widget | null;
            get_header(): string | null;
            get_status(): string;
            set_status(value: string): void;
            get_icon_name(): string | null;
            set_icon_name(value?: string | null): void;
            get_title(): string;
            set_title(value: string): void;
            get_child(): Gtk.Widget;
            set_child(value: Gtk.Widget): void;
        }

        module SimpleSettingsPage {
            // Constructor properties interface

            interface ConstructorProps extends SettingsPage.ConstructorProps {
                action_area: Gtk.Box;
                actionArea: Gtk.Box;
                content_area: Gtk.Grid;
                contentArea: Gtk.Grid;
                status_switch: Gtk.Switch;
                statusSwitch: Gtk.Switch;
                activatable: boolean;
                description: string;
            }
        }

        abstract class SimpleSettingsPage extends SettingsPage {
            static $gtype: GObject.GType<SimpleSettingsPage>;

            // Properties

            get action_area(): Gtk.Box;
            get actionArea(): Gtk.Box;
            get content_area(): Gtk.Grid;
            get contentArea(): Gtk.Grid;
            get status_switch(): Gtk.Switch;
            get statusSwitch(): Gtk.Switch;
            get activatable(): boolean;
            get description(): string;
            set description(val: string);

            // Constructors

            constructor(properties?: Partial<SimpleSettingsPage.ConstructorProps>, ...args: any[]);

            _init(...args: any[]): void;

            // Methods

            get_action_area(): Gtk.Box;
            get_content_area(): Gtk.Grid;
            get_status_switch(): Gtk.Switch | null;
            get_activatable(): boolean;
            get_description(): string;
            set_description(value: string): void;
        }

        module AccelLabel {
            // Constructor properties interface

            interface ConstructorProps extends Gtk.Box.ConstructorProps {
                action_name: string;
                actionName: string;
                accel_string: string;
                accelString: string;
                label: string;
            }
        }

        class AccelLabel extends Gtk.Box {
            static $gtype: GObject.GType<AccelLabel>;

            // Properties

            get action_name(): string;
            set action_name(val: string);
            get actionName(): string;
            set actionName(val: string);
            get accel_string(): string;
            set accel_string(val: string);
            get accelString(): string;
            set accelString(val: string);
            get label(): string;
            set label(val: string);

            // Constructors

            constructor(properties?: Partial<AccelLabel.ConstructorProps>, ...args: any[]);

            _init(...args: any[]): void;

            static ['new'](label: string, accel_string?: string | null): AccelLabel;
            // Conflicted with Gtk.Box.new

            static ['new'](...args: never[]): any;

            static from_action_name(label: string, action_name: string): AccelLabel;

            // Methods

            get_action_name(): string;
            set_action_name(value: string): void;
            get_accel_string(): string | null;
            set_accel_string(value?: string | null): void;
            get_label(): string;
            set_label(value: string): void;
        }

        module DatePicker {
            // Constructor properties interface

            interface ConstructorProps extends Gtk.Entry.ConstructorProps, Gtk.Buildable.ConstructorProps {
                format: string;
                date: GLib.DateTime;
            }
        }

        class DatePicker extends Gtk.Entry implements Gtk.Buildable {
            static $gtype: GObject.GType<DatePicker>;

            // Properties

            get format(): string;
            get date(): GLib.DateTime;
            set date(val: GLib.DateTime);

            // Constructors

            constructor(properties?: Partial<DatePicker.ConstructorProps>, ...args: any[]);

            _init(...args: any[]): void;

            static with_format(format: string): DatePicker;

            static ['new'](): DatePicker;

            // Methods

            get_format(): string;
            get_date(): GLib.DateTime;
            set_date(value: GLib.DateTime): void;

            // Inherited methods
            /**
             * Creates a binding between `source_property` on `source` and `target_property`
             * on `target`.
             *
             * Whenever the `source_property` is changed the `target_property` is
             * updated using the same value. For instance:
             *
             *
             * ```c
             *   g_object_bind_property (action, "active", widget, "sensitive", 0);
             * ```
             *
             *
             * Will result in the "sensitive" property of the widget #GObject instance to be
             * updated with the same value of the "active" property of the action #GObject
             * instance.
             *
             * If `flags` contains %G_BINDING_BIDIRECTIONAL then the binding will be mutual:
             * if `target_property` on `target` changes then the `source_property` on `source`
             * will be updated as well.
             *
             * The binding will automatically be removed when either the `source` or the
             * `target` instances are finalized. To remove the binding without affecting the
             * `source` and the `target` you can just call g_object_unref() on the returned
             * #GBinding instance.
             *
             * Removing the binding by calling g_object_unref() on it must only be done if
             * the binding, `source` and `target` are only used from a single thread and it
             * is clear that both `source` and `target` outlive the binding. Especially it
             * is not safe to rely on this if the binding, `source` or `target` can be
             * finalized from different threads. Keep another reference to the binding and
             * use g_binding_unbind() instead to be on the safe side.
             *
             * A #GObject can have multiple bindings.
             * @param source_property the property on @source to bind
             * @param target the target #GObject
             * @param target_property the property on @target to bind
             * @param flags flags to pass to #GBinding
             * @returns the #GBinding instance representing the     binding between the two #GObject instances. The binding is released     whenever the #GBinding reference count reaches zero.
             */
            bind_property(
                source_property: string,
                target: GObject.Object,
                target_property: string,
                flags: GObject.BindingFlags | null,
            ): GObject.Binding;
            /**
             * Complete version of g_object_bind_property().
             *
             * Creates a binding between `source_property` on `source` and `target_property`
             * on `target,` allowing you to set the transformation functions to be used by
             * the binding.
             *
             * If `flags` contains %G_BINDING_BIDIRECTIONAL then the binding will be mutual:
             * if `target_property` on `target` changes then the `source_property` on `source`
             * will be updated as well. The `transform_from` function is only used in case
             * of bidirectional bindings, otherwise it will be ignored
             *
             * The binding will automatically be removed when either the `source` or the
             * `target` instances are finalized. This will release the reference that is
             * being held on the #GBinding instance; if you want to hold on to the
             * #GBinding instance, you will need to hold a reference to it.
             *
             * To remove the binding, call g_binding_unbind().
             *
             * A #GObject can have multiple bindings.
             *
             * The same `user_data` parameter will be used for both `transform_to`
             * and `transform_from` transformation functions; the `notify` function will
             * be called once, when the binding is removed. If you need different data
             * for each transformation function, please use
             * g_object_bind_property_with_closures() instead.
             * @param source_property the property on @source to bind
             * @param target the target #GObject
             * @param target_property the property on @target to bind
             * @param flags flags to pass to #GBinding
             * @param transform_to the transformation function     from the @source to the @target, or %NULL to use the default
             * @param transform_from the transformation function     from the @target to the @source, or %NULL to use the default
             * @param notify a function to call when disposing the binding, to free     resources used by the transformation functions, or %NULL if not required
             * @returns the #GBinding instance representing the     binding between the two #GObject instances. The binding is released     whenever the #GBinding reference count reaches zero.
             */
            bind_property_full(
                source_property: string,
                target: GObject.Object,
                target_property: string,
                flags: GObject.BindingFlags | null,
                transform_to?: GObject.BindingTransformFunc | null,
                transform_from?: GObject.BindingTransformFunc | null,
                notify?: GLib.DestroyNotify | null,
            ): GObject.Binding;
            // Conflicted with GObject.Object.bind_property_full
            bind_property_full(...args: never[]): any;
            /**
             * This function is intended for #GObject implementations to re-enforce
             * a [floating][floating-ref] object reference. Doing this is seldom
             * required: all #GInitiallyUnowneds are created with a floating reference
             * which usually just needs to be sunken by calling g_object_ref_sink().
             */
            force_floating(): void;
            /**
             * Increases the freeze count on `object`. If the freeze count is
             * non-zero, the emission of "notify" signals on `object` is
             * stopped. The signals are queued until the freeze count is decreased
             * to zero. Duplicate notifications are squashed so that at most one
             * #GObject::notify signal is emitted for each property modified while the
             * object is frozen.
             *
             * This is necessary for accessors that modify multiple properties to prevent
             * premature notification while the object is still being modified.
             */
            freeze_notify(): void;
            /**
             * Gets a named field from the objects table of associations (see g_object_set_data()).
             * @param key name of the key for that association
             * @returns the data if found,          or %NULL if no such data exists.
             */
            get_data(key: string): any | null;
            get_property(property_name: string): any;
            /**
             * This function gets back user data pointers stored via
             * g_object_set_qdata().
             * @param quark A #GQuark, naming the user data pointer
             * @returns The user data pointer set, or %NULL
             */
            get_qdata(quark: GLib.Quark): any | null;
            /**
             * Gets `n_properties` properties for an `object`.
             * Obtained properties will be set to `values`. All properties must be valid.
             * Warnings will be emitted and undefined behaviour may result if invalid
             * properties are passed in.
             * @param names the names of each property to get
             * @param values the values of each property to get
             */
            getv(names: string[], values: (GObject.Value | any)[]): void;
            /**
             * Checks whether `object` has a [floating][floating-ref] reference.
             * @returns %TRUE if @object has a floating reference
             */
            is_floating(): boolean;
            /**
             * Emits a "notify" signal for the property `property_name` on `object`.
             *
             * When possible, eg. when signaling a property change from within the class
             * that registered the property, you should use g_object_notify_by_pspec()
             * instead.
             *
             * Note that emission of the notify signal may be blocked with
             * g_object_freeze_notify(). In this case, the signal emissions are queued
             * and will be emitted (in reverse order) when g_object_thaw_notify() is
             * called.
             * @param property_name the name of a property installed on the class of @object.
             */
            notify(property_name: string): void;
            /**
             * Emits a "notify" signal for the property specified by `pspec` on `object`.
             *
             * This function omits the property name lookup, hence it is faster than
             * g_object_notify().
             *
             * One way to avoid using g_object_notify() from within the
             * class that registered the properties, and using g_object_notify_by_pspec()
             * instead, is to store the GParamSpec used with
             * g_object_class_install_property() inside a static array, e.g.:
             *
             *
             * ```c
             *   typedef enum
             *   {
             *     PROP_FOO = 1,
             *     PROP_LAST
             *   } MyObjectProperty;
             *
             *   static GParamSpec *properties[PROP_LAST];
             *
             *   static void
             *   my_object_class_init (MyObjectClass *klass)
             *   {
             *     properties[PROP_FOO] = g_param_spec_int ("foo", NULL, NULL,
             *                                              0, 100,
             *                                              50,
             *                                              G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS);
             *     g_object_class_install_property (gobject_class,
             *                                      PROP_FOO,
             *                                      properties[PROP_FOO]);
             *   }
             * ```
             *
             *
             * and then notify a change on the "foo" property with:
             *
             *
             * ```c
             *   g_object_notify_by_pspec (self, properties[PROP_FOO]);
             * ```
             *
             * @param pspec the #GParamSpec of a property installed on the class of @object.
             */
            notify_by_pspec(pspec: GObject.ParamSpec): void;
            /**
             * Increases the reference count of `object`.
             *
             * Since GLib 2.56, if `GLIB_VERSION_MAX_ALLOWED` is 2.56 or greater, the type
             * of `object` will be propagated to the return type (using the GCC typeof()
             * extension), so any casting the caller needs to do on the return type must be
             * explicit.
             * @returns the same @object
             */
            ref(): GObject.Object;
            /**
             * Increase the reference count of `object,` and possibly remove the
             * [floating][floating-ref] reference, if `object` has a floating reference.
             *
             * In other words, if the object is floating, then this call "assumes
             * ownership" of the floating reference, converting it to a normal
             * reference by clearing the floating flag while leaving the reference
             * count unchanged.  If the object is not floating, then this call
             * adds a new normal reference increasing the reference count by one.
             *
             * Since GLib 2.56, the type of `object` will be propagated to the return type
             * under the same conditions as for g_object_ref().
             * @returns @object
             */
            ref_sink(): GObject.Object;
            /**
             * Releases all references to other objects. This can be used to break
             * reference cycles.
             *
             * This function should only be called from object system implementations.
             */
            run_dispose(): void;
            /**
             * Each object carries around a table of associations from
             * strings to pointers.  This function lets you set an association.
             *
             * If the object already had an association with that name,
             * the old association will be destroyed.
             *
             * Internally, the `key` is converted to a #GQuark using g_quark_from_string().
             * This means a copy of `key` is kept permanently (even after `object` has been
             * finalized) — so it is recommended to only use a small, bounded set of values
             * for `key` in your program, to avoid the #GQuark storage growing unbounded.
             * @param key name of the key
             * @param data data to associate with that key
             */
            set_data(key: string, data?: any | null): void;
            set_property(property_name: string, value: any): void;
            /**
             * Remove a specified datum from the object's data associations,
             * without invoking the association's destroy handler.
             * @param key name of the key
             * @returns the data if found, or %NULL          if no such data exists.
             */
            steal_data(key: string): any | null;
            /**
             * This function gets back user data pointers stored via
             * g_object_set_qdata() and removes the `data` from object
             * without invoking its destroy() function (if any was
             * set).
             * Usually, calling this function is only required to update
             * user data pointers with a destroy notifier, for example:
             *
             * ```c
             * void
             * object_add_to_user_list (GObject     *object,
             *                          const gchar *new_string)
             * {
             *   // the quark, naming the object data
             *   GQuark quark_string_list = g_quark_from_static_string ("my-string-list");
             *   // retrieve the old string list
             *   GList *list = g_object_steal_qdata (object, quark_string_list);
             *
             *   // prepend new string
             *   list = g_list_prepend (list, g_strdup (new_string));
             *   // this changed 'list', so we need to set it again
             *   g_object_set_qdata_full (object, quark_string_list, list, free_string_list);
             * }
             * static void
             * free_string_list (gpointer data)
             * {
             *   GList *node, *list = data;
             *
             *   for (node = list; node; node = node->next)
             *     g_free (node->data);
             *   g_list_free (list);
             * }
             * ```
             *
             * Using g_object_get_qdata() in the above example, instead of
             * g_object_steal_qdata() would have left the destroy function set,
             * and thus the partial string list would have been freed upon
             * g_object_set_qdata_full().
             * @param quark A #GQuark, naming the user data pointer
             * @returns The user data pointer set, or %NULL
             */
            steal_qdata(quark: GLib.Quark): any | null;
            /**
             * Reverts the effect of a previous call to
             * g_object_freeze_notify(). The freeze count is decreased on `object`
             * and when it reaches zero, queued "notify" signals are emitted.
             *
             * Duplicate notifications for each property are squashed so that at most one
             * #GObject::notify signal is emitted for each property, in the reverse order
             * in which they have been queued.
             *
             * It is an error to call this function when the freeze count is zero.
             */
            thaw_notify(): void;
            /**
             * Decreases the reference count of `object`. When its reference count
             * drops to 0, the object is finalized (i.e. its memory is freed).
             *
             * If the pointer to the #GObject may be reused in future (for example, if it is
             * an instance variable of another object), it is recommended to clear the
             * pointer to %NULL rather than retain a dangling pointer to a potentially
             * invalid #GObject instance. Use g_clear_object() for this.
             */
            unref(): void;
            /**
             * This function essentially limits the life time of the `closure` to
             * the life time of the object. That is, when the object is finalized,
             * the `closure` is invalidated by calling g_closure_invalidate() on
             * it, in order to prevent invocations of the closure with a finalized
             * (nonexisting) object. Also, g_object_ref() and g_object_unref() are
             * added as marshal guards to the `closure,` to ensure that an extra
             * reference count is held on `object` during invocation of the
             * `closure`.  Usually, this function will be called on closures that
             * use this `object` as closure data.
             * @param closure #GClosure to watch
             */
            watch_closure(closure: GObject.Closure): void;
            /**
             * the `constructed` function is called by g_object_new() as the
             *  final step of the object creation process.  At the point of the call, all
             *  construction properties have been set on the object.  The purpose of this
             *  call is to allow for object initialisation steps that can only be performed
             *  after construction properties have been set.  `constructed` implementors
             *  should chain up to the `constructed` call of their parent class to allow it
             *  to complete its initialisation.
             */
            vfunc_constructed(): void;
            /**
             * emits property change notification for a bunch
             *  of properties. Overriding `dispatch_properties_changed` should be rarely
             *  needed.
             * @param n_pspecs
             * @param pspecs
             */
            vfunc_dispatch_properties_changed(n_pspecs: number, pspecs: GObject.ParamSpec): void;
            /**
             * the `dispose` function is supposed to drop all references to other
             *  objects, but keep the instance otherwise intact, so that client method
             *  invocations still work. It may be run multiple times (due to reference
             *  loops). Before returning, `dispose` should chain up to the `dispose` method
             *  of the parent class.
             */
            vfunc_dispose(): void;
            /**
             * instance finalization function, should finish the finalization of
             *  the instance begun in `dispose` and chain up to the `finalize` method of the
             *  parent class.
             */
            vfunc_finalize(): void;
            /**
             * the generic getter for all properties of this type. Should be
             *  overridden for every type with properties.
             * @param property_id
             * @param value
             * @param pspec
             */
            vfunc_get_property(property_id: number, value: GObject.Value | any, pspec: GObject.ParamSpec): void;
            /**
             * Emits a "notify" signal for the property `property_name` on `object`.
             *
             * When possible, eg. when signaling a property change from within the class
             * that registered the property, you should use g_object_notify_by_pspec()
             * instead.
             *
             * Note that emission of the notify signal may be blocked with
             * g_object_freeze_notify(). In this case, the signal emissions are queued
             * and will be emitted (in reverse order) when g_object_thaw_notify() is
             * called.
             * @param pspec
             */
            vfunc_notify(pspec: GObject.ParamSpec): void;
            /**
             * the generic setter for all properties of this type. Should be
             *  overridden for every type with properties. If implementations of
             *  `set_property` don't emit property change notification explicitly, this will
             *  be done implicitly by the type system. However, if the notify signal is
             *  emitted explicitly, the type system will not emit it a second time.
             * @param property_id
             * @param value
             * @param pspec
             */
            vfunc_set_property(property_id: number, value: GObject.Value | any, pspec: GObject.ParamSpec): void;
            disconnect(id: number): void;
            set(properties: { [key: string]: any }): void;
            block_signal_handler(id: number): any;
            unblock_signal_handler(id: number): any;
            stop_emission_by_name(detailedName: string): any;
        }

        module Dialog {
            // Constructor properties interface

            interface ConstructorProps extends Gtk.Dialog.ConstructorProps {}
        }

        class Dialog extends Gtk.Dialog {
            static $gtype: GObject.GType<Dialog>;

            // Constructors

            constructor(properties?: Partial<Dialog.ConstructorProps>, ...args: any[]);

            _init(...args: any[]): void;

            static ['new'](): Dialog;

            // Methods

            add_button(button_text: string, response_id: number): Gtk.Widget;
        }

        module HeaderLabel {
            // Constructor properties interface

            interface ConstructorProps extends Gtk.Widget.ConstructorProps {
                label: string;
                mnemonic_widget: Gtk.Widget;
                mnemonicWidget: Gtk.Widget;
                secondary_text: string;
                secondaryText: string;
            }
        }

        class HeaderLabel extends Gtk.Widget {
            static $gtype: GObject.GType<HeaderLabel>;

            // Properties

            get label(): string;
            set label(val: string);
            get mnemonic_widget(): Gtk.Widget;
            set mnemonic_widget(val: Gtk.Widget);
            get mnemonicWidget(): Gtk.Widget;
            set mnemonicWidget(val: Gtk.Widget);
            get secondary_text(): string;
            set secondary_text(val: string);
            get secondaryText(): string;
            set secondaryText(val: string);

            // Constructors

            constructor(properties?: Partial<HeaderLabel.ConstructorProps>, ...args: any[]);

            _init(...args: any[]): void;

            static ['new'](label: string): HeaderLabel;

            // Methods

            get_label(): string;
            set_label(value: string): void;
            get_mnemonic_widget(): Gtk.Widget | null;
            set_mnemonic_widget(value?: Gtk.Widget | null): void;
            get_secondary_text(): string | null;
            set_secondary_text(value?: string | null): void;
        }

        module HyperTextView {
            // Constructor properties interface

            interface ConstructorProps extends Gtk.TextView.ConstructorProps {}
        }

        class HyperTextView extends Gtk.TextView {
            static $gtype: GObject.GType<HyperTextView>;

            // Constructors

            constructor(properties?: Partial<HyperTextView.ConstructorProps>, ...args: any[]);

            _init(...args: any[]): void;

            static ['new'](): HyperTextView;
        }

        module MessageDialog {
            // Constructor properties interface

            interface ConstructorProps extends Dialog.ConstructorProps {
                primary_text: string;
                primaryText: string;
                secondary_text: string;
                secondaryText: string;
                image_icon: Gio.Icon;
                imageIcon: Gio.Icon;
                badge_icon: Gio.Icon;
                badgeIcon: Gio.Icon;
                primary_label: Gtk.Label;
                primaryLabel: Gtk.Label;
                secondary_label: Gtk.Label;
                secondaryLabel: Gtk.Label;
                buttons: Gtk.ButtonsType;
                custom_bin: Gtk.Box;
                customBin: Gtk.Box;
            }
        }

        class MessageDialog extends Dialog {
            static $gtype: GObject.GType<MessageDialog>;

            // Properties

            get primary_text(): string;
            set primary_text(val: string);
            get primaryText(): string;
            set primaryText(val: string);
            get secondary_text(): string;
            set secondary_text(val: string);
            get secondaryText(): string;
            set secondaryText(val: string);
            get image_icon(): Gio.Icon;
            set image_icon(val: Gio.Icon);
            get imageIcon(): Gio.Icon;
            set imageIcon(val: Gio.Icon);
            get badge_icon(): Gio.Icon;
            set badge_icon(val: Gio.Icon);
            get badgeIcon(): Gio.Icon;
            set badgeIcon(val: Gio.Icon);
            get primary_label(): Gtk.Label;
            get primaryLabel(): Gtk.Label;
            get secondary_label(): Gtk.Label;
            get secondaryLabel(): Gtk.Label;
            set buttons(val: Gtk.ButtonsType);
            get custom_bin(): Gtk.Box;
            get customBin(): Gtk.Box;

            // Constructors

            constructor(properties?: Partial<MessageDialog.ConstructorProps>, ...args: any[]);

            _init(...args: any[]): void;

            static ['new'](
                primary_text: string,
                secondary_text: string,
                image_icon: Gio.Icon,
                buttons: Gtk.ButtonsType,
            ): MessageDialog;
            // Conflicted with Granite.Dialog.new

            static ['new'](...args: never[]): any;

            static with_image_from_icon_name(
                primary_text: string,
                secondary_text: string,
                image_icon_name: string,
                buttons: Gtk.ButtonsType,
            ): MessageDialog;

            // Methods

            get_primary_text(): string;
            set_primary_text(value: string): void;
            get_secondary_text(): string;
            set_secondary_text(value: string): void;
            get_image_icon(): Gio.Icon;
            set_image_icon(value: Gio.Icon): void;
            get_badge_icon(): Gio.Icon;
            set_badge_icon(value: Gio.Icon): void;
            get_primary_label(): Gtk.Label;
            get_secondary_label(): Gtk.Label;
            get_custom_bin(): Gtk.Box;
            show_error_details(error_message: string): void;
        }

        module ModeSwitch {
            // Constructor properties interface

            interface ConstructorProps extends Gtk.Box.ConstructorProps {
                active: boolean;
                primary_icon_gicon: Gio.Icon;
                primaryIconGicon: Gio.Icon;
                primary_icon_name: string;
                primaryIconName: string;
                primary_icon_tooltip_text: string;
                primaryIconTooltipText: string;
                secondary_icon_gicon: Gio.Icon;
                secondaryIconGicon: Gio.Icon;
                secondary_icon_name: string;
                secondaryIconName: string;
                secondary_icon_tooltip_text: string;
                secondaryIconTooltipText: string;
            }
        }

        class ModeSwitch extends Gtk.Box {
            static $gtype: GObject.GType<ModeSwitch>;

            // Properties

            get active(): boolean;
            set active(val: boolean);
            get primary_icon_gicon(): Gio.Icon;
            set primary_icon_gicon(val: Gio.Icon);
            get primaryIconGicon(): Gio.Icon;
            set primaryIconGicon(val: Gio.Icon);
            get primary_icon_name(): string;
            set primary_icon_name(val: string);
            get primaryIconName(): string;
            set primaryIconName(val: string);
            get primary_icon_tooltip_text(): string;
            set primary_icon_tooltip_text(val: string);
            get primaryIconTooltipText(): string;
            set primaryIconTooltipText(val: string);
            get secondary_icon_gicon(): Gio.Icon;
            set secondary_icon_gicon(val: Gio.Icon);
            get secondaryIconGicon(): Gio.Icon;
            set secondaryIconGicon(val: Gio.Icon);
            get secondary_icon_name(): string;
            set secondary_icon_name(val: string);
            get secondaryIconName(): string;
            set secondaryIconName(val: string);
            get secondary_icon_tooltip_text(): string;
            set secondary_icon_tooltip_text(val: string);
            get secondaryIconTooltipText(): string;
            set secondaryIconTooltipText(val: string);

            // Constructors

            constructor(properties?: Partial<ModeSwitch.ConstructorProps>, ...args: any[]);

            _init(...args: any[]): void;

            static ['new'](primary_icon_gicon: Gio.Icon, secondary_icon_gicon: Gio.Icon): ModeSwitch;
            // Conflicted with Gtk.Box.new

            static ['new'](...args: never[]): any;

            static from_icon_name(primary_icon_name: string, secondary_icon_name: string): ModeSwitch;

            // Methods

            get_active(): boolean;
            set_active(value: boolean): void;
            get_primary_icon_gicon(): Gio.Icon;
            set_primary_icon_gicon(value: Gio.Icon): void;
            get_primary_icon_name(): string;
            set_primary_icon_name(value: string): void;
            get_primary_icon_tooltip_text(): string;
            set_primary_icon_tooltip_text(value: string): void;
            get_secondary_icon_gicon(): Gio.Icon;
            set_secondary_icon_gicon(value: Gio.Icon): void;
            get_secondary_icon_name(): string;
            set_secondary_icon_name(value: string): void;
            get_secondary_icon_tooltip_text(): string;
            set_secondary_icon_tooltip_text(value: string): void;
        }

        module OverlayBar {
            // Constructor properties interface

            interface ConstructorProps extends Gtk.Widget.ConstructorProps {
                overlay: Gtk.Overlay;
                label: string;
                active: boolean;
            }
        }

        class OverlayBar extends Gtk.Widget {
            static $gtype: GObject.GType<OverlayBar>;

            // Properties

            get overlay(): Gtk.Overlay;
            get label(): string;
            set label(val: string);
            get active(): boolean;
            set active(val: boolean);

            // Constructors

            constructor(properties?: Partial<OverlayBar.ConstructorProps>, ...args: any[]);

            _init(...args: any[]): void;

            static ['new'](overlay?: Gtk.Overlay | null): OverlayBar;

            // Methods

            get_overlay(): Gtk.Overlay | null;
            get_label(): string;
            set_label(value: string): void;
            get_active(): boolean;
            set_active(value: boolean): void;
        }

        module Placeholder {
            // Constructor properties interface

            interface ConstructorProps extends Gtk.Widget.ConstructorProps {
                title: string;
                description: string;
                icon: Gio.Icon;
            }
        }

        class Placeholder extends Gtk.Widget {
            static $gtype: GObject.GType<Placeholder>;

            // Properties

            get title(): string;
            set title(val: string);
            get description(): string;
            set description(val: string);
            get icon(): Gio.Icon;
            set icon(val: Gio.Icon);

            // Constructors

            constructor(properties?: Partial<Placeholder.ConstructorProps>, ...args: any[]);

            _init(...args: any[]): void;

            static ['new'](title: string): Placeholder;

            // Methods

            get_title(): string;
            set_title(value: string): void;
            get_description(): string;
            set_description(value: string): void;
            get_icon(): Gio.Icon;
            set_icon(value: Gio.Icon): void;
            append_button(icon: Gio.Icon, label: string, description: string): Gtk.Button;
        }

        module SettingsSidebar {
            // Constructor properties interface

            interface ConstructorProps extends Gtk.Widget.ConstructorProps {
                stack: Gtk.Stack;
                visible_child_name: string;
                visibleChildName: string;
            }
        }

        class SettingsSidebar extends Gtk.Widget {
            static $gtype: GObject.GType<SettingsSidebar>;

            // Properties

            get stack(): Gtk.Stack;
            get visible_child_name(): string;
            set visible_child_name(val: string);
            get visibleChildName(): string;
            set visibleChildName(val: string);

            // Constructors

            constructor(properties?: Partial<SettingsSidebar.ConstructorProps>, ...args: any[]);

            _init(...args: any[]): void;

            static ['new'](stack: Gtk.Stack): SettingsSidebar;

            // Methods

            get_stack(): Gtk.Stack;
            get_visible_child_name(): string | null;
            set_visible_child_name(value?: string | null): void;
        }

        module Settings {
            // Constructor properties interface

            interface ConstructorProps extends GObject.Object.ConstructorProps {
                prefers_color_scheme: SettingsColorScheme;
                prefersColorScheme: SettingsColorScheme;
            }
        }

        class Settings extends GObject.Object {
            static $gtype: GObject.GType<Settings>;

            // Properties

            get prefers_color_scheme(): SettingsColorScheme;
            set prefers_color_scheme(val: SettingsColorScheme);
            get prefersColorScheme(): SettingsColorScheme;
            set prefersColorScheme(val: SettingsColorScheme);

            // Constructors

            constructor(properties?: Partial<Settings.ConstructorProps>, ...args: any[]);

            _init(...args: any[]): void;

            // Static methods

            static get_default(): Settings;

            // Methods

            get_prefers_color_scheme(): SettingsColorScheme;
        }

        module SwitchModelButton {
            // Constructor properties interface

            interface ConstructorProps extends Gtk.ToggleButton.ConstructorProps {
                text: string;
                description: string;
            }
        }

        class SwitchModelButton extends Gtk.ToggleButton {
            static $gtype: GObject.GType<SwitchModelButton>;

            // Properties

            get text(): string;
            set text(val: string);
            get description(): string;
            set description(val: string);

            // Constructors

            constructor(properties?: Partial<SwitchModelButton.ConstructorProps>, ...args: any[]);

            _init(...args: any[]): void;

            static ['new'](text: string): SwitchModelButton;
            // Conflicted with Gtk.ToggleButton.new

            static ['new'](...args: never[]): any;

            // Methods

            get_text(): string;
            set_text(value: string): void;
            get_description(): string | null;
            set_description(value?: string | null): void;
        }

        module TimePicker {
            // Signal callback interfaces

            interface TimeChanged {
                (): void;
            }

            // Constructor properties interface

            interface ConstructorProps extends Gtk.Entry.ConstructorProps {
                format_12: string;
                format12: string;
                format_24: string;
                format24: string;
                time: GLib.DateTime;
            }
        }

        class TimePicker extends Gtk.Entry {
            static $gtype: GObject.GType<TimePicker>;

            // Properties

            get format_12(): string;
            get format12(): string;
            get format_24(): string;
            get format24(): string;
            get time(): GLib.DateTime;
            set time(val: GLib.DateTime);

            // Constructors

            constructor(properties?: Partial<TimePicker.ConstructorProps>, ...args: any[]);

            _init(...args: any[]): void;

            static with_format(format_12: string, format_24: string): TimePicker;

            static ['new'](): TimePicker;

            // Signals

            connect(id: string, callback: (...args: any[]) => any): number;
            connect_after(id: string, callback: (...args: any[]) => any): number;
            emit(id: string, ...args: any[]): void;
            connect(signal: 'time-changed', callback: (_source: this) => void): number;
            connect_after(signal: 'time-changed', callback: (_source: this) => void): number;
            emit(signal: 'time-changed'): void;

            // Methods

            get_format_12(): string;
            get_format_24(): string;
            get_time(): GLib.DateTime;
            set_time(value: GLib.DateTime): void;
        }

        module Toast {
            // Signal callback interfaces

            interface Closed {
                (): void;
            }

            interface Dismissed {
                (reason: ToastDismissReason): void;
            }

            interface DefaultAction {
                (): void;
            }

            // Constructor properties interface

            interface ConstructorProps extends Gtk.Widget.ConstructorProps {
                title: string;
            }
        }

        class Toast extends Gtk.Widget {
            static $gtype: GObject.GType<Toast>;

            // Properties

            get title(): string;
            set title(val: string);

            // Constructors

            constructor(properties?: Partial<Toast.ConstructorProps>, ...args: any[]);

            _init(...args: any[]): void;

            static ['new'](title: string): Toast;

            // Signals

            connect(id: string, callback: (...args: any[]) => any): number;
            connect_after(id: string, callback: (...args: any[]) => any): number;
            emit(id: string, ...args: any[]): void;
            connect(signal: 'closed', callback: (_source: this) => void): number;
            connect_after(signal: 'closed', callback: (_source: this) => void): number;
            emit(signal: 'closed'): void;
            connect(signal: 'dismissed', callback: (_source: this, reason: ToastDismissReason) => void): number;
            connect_after(signal: 'dismissed', callback: (_source: this, reason: ToastDismissReason) => void): number;
            emit(signal: 'dismissed', reason: ToastDismissReason): void;
            connect(signal: 'default-action', callback: (_source: this) => void): number;
            connect_after(signal: 'default-action', callback: (_source: this) => void): number;
            emit(signal: 'default-action'): void;

            // Methods

            get_title(): string;
            set_title(value: string): void;
            set_default_action(label?: string | null): void;
            send_notification(): void;
            withdraw(): void;
        }

        module ValidatedEntry {
            // Constructor properties interface

            interface ConstructorProps extends Gtk.Entry.ConstructorProps {
                is_valid: boolean;
                isValid: boolean;
                min_length: number;
                minLength: number;
                regex: GLib.Regex;
            }
        }

        class ValidatedEntry extends Gtk.Entry {
            static $gtype: GObject.GType<ValidatedEntry>;

            // Properties

            get is_valid(): boolean;
            set is_valid(val: boolean);
            get isValid(): boolean;
            set isValid(val: boolean);
            get min_length(): number;
            set min_length(val: number);
            get minLength(): number;
            set minLength(val: number);
            get regex(): GLib.Regex;
            set regex(val: GLib.Regex);

            // Constructors

            constructor(properties?: Partial<ValidatedEntry.ConstructorProps>, ...args: any[]);

            _init(...args: any[]): void;

            static from_regex(regex_arg: GLib.Regex): ValidatedEntry;

            static ['new'](): ValidatedEntry;

            // Methods

            get_is_valid(): boolean;
            set_is_valid(value: boolean): void;
            get_min_length(): number;
            set_min_length(value: number): void;
            get_regex(): GLib.Regex;
            set_regex(value: GLib.Regex): void;
        }

        type ServicesContractorProxyClass = typeof ServicesContractorProxy;
        abstract class ServicesContractorProxyPrivate {
            static $gtype: GObject.GType<ServicesContractorProxyPrivate>;

            // Constructors

            _init(...args: any[]): void;
        }

        type ServicesSystemClass = typeof ServicesSystem;
        abstract class ServicesSystemPrivate {
            static $gtype: GObject.GType<ServicesSystemPrivate>;

            // Constructors

            _init(...args: any[]): void;
        }

        type ServicesContractIface = typeof ServicesContract;
        type ServicesSettingsSerializableIface = typeof ServicesSettingsSerializable;
        type SettingsPageClass = typeof SettingsPage;
        abstract class SettingsPagePrivate {
            static $gtype: GObject.GType<SettingsPagePrivate>;

            // Constructors

            _init(...args: any[]): void;
        }

        type SimpleSettingsPageClass = typeof SimpleSettingsPage;
        abstract class SimpleSettingsPagePrivate {
            static $gtype: GObject.GType<SimpleSettingsPagePrivate>;

            // Constructors

            _init(...args: any[]): void;
        }

        type AccelLabelClass = typeof AccelLabel;
        abstract class AccelLabelPrivate {
            static $gtype: GObject.GType<AccelLabelPrivate>;

            // Constructors

            _init(...args: any[]): void;
        }

        type DatePickerClass = typeof DatePicker;
        abstract class DatePickerPrivate {
            static $gtype: GObject.GType<DatePickerPrivate>;

            // Constructors

            _init(...args: any[]): void;
        }

        type DialogClass = typeof Dialog;
        abstract class DialogPrivate {
            static $gtype: GObject.GType<DialogPrivate>;

            // Constructors

            _init(...args: any[]): void;
        }

        type HeaderLabelClass = typeof HeaderLabel;
        abstract class HeaderLabelPrivate {
            static $gtype: GObject.GType<HeaderLabelPrivate>;

            // Constructors

            _init(...args: any[]): void;
        }

        type HyperTextViewClass = typeof HyperTextView;
        abstract class HyperTextViewPrivate {
            static $gtype: GObject.GType<HyperTextViewPrivate>;

            // Constructors

            _init(...args: any[]): void;
        }

        type MessageDialogClass = typeof MessageDialog;
        abstract class MessageDialogPrivate {
            static $gtype: GObject.GType<MessageDialogPrivate>;

            // Constructors

            _init(...args: any[]): void;
        }

        type ModeSwitchClass = typeof ModeSwitch;
        abstract class ModeSwitchPrivate {
            static $gtype: GObject.GType<ModeSwitchPrivate>;

            // Constructors

            _init(...args: any[]): void;
        }

        type OverlayBarClass = typeof OverlayBar;
        abstract class OverlayBarPrivate {
            static $gtype: GObject.GType<OverlayBarPrivate>;

            // Constructors

            _init(...args: any[]): void;
        }

        type PlaceholderClass = typeof Placeholder;
        abstract class PlaceholderPrivate {
            static $gtype: GObject.GType<PlaceholderPrivate>;

            // Constructors

            _init(...args: any[]): void;
        }

        type SettingsSidebarClass = typeof SettingsSidebar;
        abstract class SettingsSidebarPrivate {
            static $gtype: GObject.GType<SettingsSidebarPrivate>;

            // Constructors

            _init(...args: any[]): void;
        }

        type SettingsClass = typeof Settings;
        abstract class SettingsPrivate {
            static $gtype: GObject.GType<SettingsPrivate>;

            // Constructors

            _init(...args: any[]): void;
        }

        type SwitchModelButtonClass = typeof SwitchModelButton;
        abstract class SwitchModelButtonPrivate {
            static $gtype: GObject.GType<SwitchModelButtonPrivate>;

            // Constructors

            _init(...args: any[]): void;
        }

        type TimePickerClass = typeof TimePicker;
        abstract class TimePickerPrivate {
            static $gtype: GObject.GType<TimePickerPrivate>;

            // Constructors

            _init(...args: any[]): void;
        }

        type ToastClass = typeof Toast;
        abstract class ToastPrivate {
            static $gtype: GObject.GType<ToastPrivate>;

            // Constructors

            _init(...args: any[]): void;
        }

        type ValidatedEntryClass = typeof ValidatedEntry;
        abstract class ValidatedEntryPrivate {
            static $gtype: GObject.GType<ValidatedEntryPrivate>;

            // Constructors

            _init(...args: any[]): void;
        }

        module ServicesContract {
            // Constructor properties interface

            interface ConstructorProps extends GObject.Object.ConstructorProps {}
        }

        export interface ServicesContractNamespace {
            $gtype: GObject.GType<ServicesContract>;
            prototype: ServicesContract;
        }
        interface ServicesContract extends GObject.Object {
            // Methods

            get_display_name(): string;
            get_description(): string;
            get_icon(): Gio.Icon;
            execute_with_file(file: Gio.File): void;
            execute_with_files(files: Gio.File[]): void;

            // Virtual methods

            vfunc_get_display_name(): string;
            vfunc_get_description(): string;
            vfunc_get_icon(): Gio.Icon;
            vfunc_execute_with_file(file: Gio.File): void;
            vfunc_execute_with_files(files: Gio.File[]): void;
        }

        export const ServicesContract: ServicesContractNamespace & {
            new (): ServicesContract; // This allows `obj instanceof ServicesContract`
        };

        module ServicesSettingsSerializable {
            // Constructor properties interface

            interface ConstructorProps extends GObject.Object.ConstructorProps {}
        }

        export interface ServicesSettingsSerializableNamespace {
            $gtype: GObject.GType<ServicesSettingsSerializable>;
            prototype: ServicesSettingsSerializable;
        }
        interface ServicesSettingsSerializable extends GObject.Object {
            // Methods

            settings_serialize(): string;
            settings_deserialize(s: string): void;

            // Virtual methods

            vfunc_settings_serialize(): string;
            vfunc_settings_deserialize(s: string): void;
        }

        export const ServicesSettingsSerializable: ServicesSettingsSerializableNamespace & {
            new (): ServicesSettingsSerializable; // This allows `obj instanceof ServicesSettingsSerializable`
        };

        /**
         * Name of the imported GIR library
         * `see` https://gitlab.gnome.org/GNOME/gjs/-/blob/master/gi/ns.cpp#L188
         */
        const __name__: string;
        /**
         * Version of the imported GIR library
         * `see` https://gitlab.gnome.org/GNOME/gjs/-/blob/master/gi/ns.cpp#L189
         */
        const __version__: string;
    }

    export default Granite;
}

declare module 'gi://Granite' {
    import Granite70 from 'gi://Granite?version=7.0';
    export default Granite70;
}
// END
