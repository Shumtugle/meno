.class public Lio/github/shumtugle/meno/MenoWidget;
.super Landroid/appwidget/AppWidgetProvider;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/appwidget/AppWidgetProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4

    invoke-super {p0, p1, p2}, Landroid/appwidget/AppWidgetProvider;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    const-string v1, "android.intent.action.ACTION_POWER_CONNECTED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "android.intent.action.ACTION_POWER_DISCONNECTED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "android.intent.action.BATTERY_LOW"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "android.intent.action.BATTERY_OKAY"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "io.github.shumtugle.meno.TICK"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    invoke-static {p1}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    move-result-object v1

    new-instance v2, Landroid/content/ComponentName;

    const-class v3, Lio/github/shumtugle/meno/MenoWidget;

    invoke-direct {v2, p1, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, v2}, Landroid/appwidget/AppWidgetManager;->getAppWidgetIds(Landroid/content/ComponentName;)[I

    move-result-object v2

    invoke-virtual {p0, p1, v1, v2}, Lio/github/shumtugle/meno/MenoWidget;->onUpdate(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;[I)V

    :cond_1
    return-void
.end method

.method private static applyZone(Landroid/content/Context;Landroid/widget/RemoteViews;II)V
    .locals 4

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "zone_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "meno"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :none

    invoke-static {v0}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    move-result-object v0

    if-eqz v0, :none

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.MAIN"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    const/high16 v0, 0x10000000

    invoke-virtual {v1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    add-int/lit8 v2, p3, 0x10

    const/high16 v3, 0x4000000

    invoke-static {p0, v2, v1, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    :none
    return-void
.end method

.method public onUpdate(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;[I)V
    .locals 8

    new-instance v0, Landroid/widget/RemoteViews;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f030001

    invoke-direct {v0, v1, v2}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    new-instance v1, Lio/github/shumtugle/meno/WeatherJob;

    invoke-direct {v1, p1}, Lio/github/shumtugle/meno/WeatherJob;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Lio/github/shumtugle/meno/WeatherJob;->start()V

    invoke-static {p1}, Lio/github/shumtugle/meno/LocaleUtil;->locale(Landroid/content/Context;)Ljava/util/Locale;

    move-result-object v1

    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v3, "EEE, d MMMM"

    invoke-direct {v2, v3, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f040002

    invoke-virtual {v0, v2, v1}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    const-string v1, "meno"

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "bg"

    const/4 v3, -0x1

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    const/4 v2, 0x0

    const/16 v3, 0xa

    if-ne v1, v3, :b20

    const v2, 0x7f020009

    goto :apply_bg

    :b20
    const/16 v3, 0x14

    if-ne v1, v3, :b40

    const v2, 0x7f02000a

    goto :apply_bg

    :b40
    const/16 v3, 0x28

    if-ne v1, v3, :b60

    const v2, 0x7f02000b

    goto :apply_bg

    :b60
    const/16 v3, 0x3c

    if-ne v1, v3, :b80

    const v2, 0x7f02000c

    goto :apply_bg

    :b80
    const/16 v3, 0x50

    if-ne v1, v3, :b90

    const v2, 0x7f02000d

    goto :apply_bg

    :b90
    const/16 v3, 0x5a

    if-ne v1, v3, :bgt

    const v2, 0x7f02000e

    goto :apply_bg

    :bgt
    const/16 v3, 0x64

    if-ne v1, v3, :bgb

    const v2, 0x7f02000f

    goto :apply_bg

    :bgb
    const/16 v3, 0x65

    if-ne v1, v3, :bgl

    const v2, 0x7f020010

    goto :apply_bg

    :bgl
    const/16 v3, 0x66

    if-ne v1, v3, :bgr

    const v2, 0x7f020011

    goto :apply_bg

    :bgr
    const/16 v3, 0x67

    if-ne v1, v3, :bgd

    const v2, 0x7f020012

    goto :apply_bg

    :bgd
    const/16 v3, 0x68

    if-ne v1, v3, :apply_bg

    const v2, 0x7f020013

    :apply_bg
    if-nez v2, :do_bg

    const v2, 0x7f020000

    :do_bg
    const v1, 0x7f040005

    const-string v3, "setBackgroundResource"

    invoke-virtual {v0, v1, v3, v2}, Landroid/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    :bg_done
    const-string v1, "meno"

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "fmt"

    const-string v3, "auto"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "24"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :fmt_not24

    const v3, 0x7f040001

    const-string v4, "setFormat12Hour"

    const-string v5, "HH:mm"

    invoke-virtual {v0, v3, v4, v5}, Landroid/widget/RemoteViews;->setCharSequence(ILjava/lang/String;Ljava/lang/CharSequence;)V

    const-string v4, "setFormat24Hour"

    invoke-virtual {v0, v3, v4, v5}, Landroid/widget/RemoteViews;->setCharSequence(ILjava/lang/String;Ljava/lang/CharSequence;)V

    goto :fmt_done

    :fmt_not24
    const-string v3, "12"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :fmt_done

    const v3, 0x7f040001

    const-string v4, "setFormat12Hour"

    const-string v5, "h:mm a"

    invoke-virtual {v0, v3, v4, v5}, Landroid/widget/RemoteViews;->setCharSequence(ILjava/lang/String;Ljava/lang/CharSequence;)V

    const-string v4, "setFormat24Hour"

    invoke-virtual {v0, v3, v4, v5}, Landroid/widget/RemoteViews;->setCharSequence(ILjava/lang/String;Ljava/lang/CharSequence;)V

    :fmt_done
    const-string v2, "second"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    const v2, 0x7f040000

    const/16 v3, 0x8

    if-nez v1, :s0

    const/4 v3, 0x0

    :s0
    invoke-virtual {v0, v2, v3}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    const v2, 0x7f040008

    const/16 v3, 0x8

    const/4 v4, 0x1

    if-ne v1, v4, :s1

    const/4 v3, 0x0

    :s1
    invoke-virtual {v0, v2, v3}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    const v2, 0x7f040009

    const/16 v3, 0x8

    const/4 v4, 0x2

    if-ne v1, v4, :s2

    const/4 v3, 0x0

    :s2
    invoke-virtual {v0, v2, v3}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    const v2, 0x7f04000a

    const/16 v3, 0x8

    const/4 v4, 0x3

    if-ne v1, v4, :s3

    const/4 v3, 0x0

    :s3
    invoke-virtual {v0, v2, v3}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    const v2, 0x7f04000c

    const/16 v3, 0x8

    const/4 v4, 0x4

    if-ne v1, v4, :s4

    const/4 v3, 0x0

    :s4
    invoke-virtual {v0, v2, v3}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    const v2, 0x7f04000d

    const/16 v3, 0x8

    const/4 v4, 0x5

    if-ne v1, v4, :s5

    const/4 v3, 0x0

    :s5
    invoke-virtual {v0, v2, v3}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    const v2, 0x7f04000f

    const/16 v3, 0x8

    const/4 v4, 0x6

    if-ne v1, v4, :s6

    const/4 v3, 0x0

    :s6
    invoke-virtual {v0, v2, v3}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.SHOW_ALARMS"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v2, 0x10000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const/4 v2, 0x0

    const/high16 v3, 0x4000000

    invoke-static {p1, v2, v1, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    const v2, 0x7f040000

    invoke-virtual {v0, v2, v1}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    const v2, 0x7f040001

    invoke-virtual {v0, v2, v1}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    const v2, 0x7f040008

    invoke-virtual {v0, v2, v1}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    const v2, 0x7f040009

    invoke-virtual {v0, v2, v1}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    const v2, 0x7f04000a

    invoke-virtual {v0, v2, v1}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    const v2, 0x7f04000c

    invoke-virtual {v0, v2, v1}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    const v2, 0x7f04000d

    invoke-virtual {v0, v2, v1}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    const v2, 0x7f04000f

    invoke-virtual {v0, v2, v1}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    const-string v1, "android.intent.action.MAIN"

    const-string v2, "android.intent.category.APP_CALENDAR"

    invoke-static {v1, v2}, Landroid/content/Intent;->makeMainSelectorActivity(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    const/high16 v2, 0x10000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const/4 v2, 0x1

    const/high16 v3, 0x4000000

    invoke-static {p1, v2, v1, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    const v2, 0x7f040002

    invoke-virtual {v0, v2, v1}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string v2, "level"

    const/4 v3, -0x1

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    const-string v4, "scale"

    const/16 v5, 0x64

    invoke-virtual {v1, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    if-ltz v2, :cond_0

    if-lez v4, :cond_0

    mul-int/lit8 v2, v2, 0x64

    div-int/2addr v2, v4

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "%"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f040003

    invoke-virtual {v0, v4, v3}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    :cond_0
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.POWER_USAGE_SUMMARY"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v2, 0x10000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const/4 v2, 0x2

    const/high16 v3, 0x4000000

    invoke-static {p1, v2, v1, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    const v2, 0x7f040003

    invoke-virtual {v0, v2, v1}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.WEB_SEARCH"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "query"

    const-string v3, "weather"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/4 v2, 0x3

    const/high16 v3, 0x4000000

    invoke-static {p1, v2, v1, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    const v2, 0x7f040007

    invoke-virtual {v0, v2, v1}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    :cond_nobw
    const v1, 0x7f040000

    const/4 v2, 0x0

    invoke-static {p1, v0, v1, v2}, Lio/github/shumtugle/meno/MenoWidget;->applyZone(Landroid/content/Context;Landroid/widget/RemoteViews;II)V

    const v1, 0x7f040001

    const/4 v2, 0x1

    invoke-static {p1, v0, v1, v2}, Lio/github/shumtugle/meno/MenoWidget;->applyZone(Landroid/content/Context;Landroid/widget/RemoteViews;II)V

    const v1, 0x7f040002

    const/4 v2, 0x2

    invoke-static {p1, v0, v1, v2}, Lio/github/shumtugle/meno/MenoWidget;->applyZone(Landroid/content/Context;Landroid/widget/RemoteViews;II)V

    const v1, 0x7f040003

    const/4 v2, 0x3

    invoke-static {p1, v0, v1, v2}, Lio/github/shumtugle/meno/MenoWidget;->applyZone(Landroid/content/Context;Landroid/widget/RemoteViews;II)V

    const v1, 0x7f040007

    const/4 v2, 0x4

    invoke-static {p1, v0, v1, v2}, Lio/github/shumtugle/meno/MenoWidget;->applyZone(Landroid/content/Context;Landroid/widget/RemoteViews;II)V

    const-string v1, "alarm"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/AlarmManager;

    new-instance v2, Landroid/content/Intent;

    const-string v3, "io.github.shumtugle.meno.TICK"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-class v3, Lio/github/shumtugle/meno/MenoWidget;

    invoke-virtual {v2, p1, v3}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    move-result-object v2

    const/4 v3, 0x7

    const/high16 v4, 0x4000000

    invoke-static {p1, v3, v2, v4}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    const-wide/32 v5, 0x927c0

    add-long/2addr v3, v5

    const/4 v7, 0x2

    invoke-virtual {v1, v7, v3, v4, v2}, Landroid/app/AlarmManager;->setAndAllowWhileIdle(IJLandroid/app/PendingIntent;)V

    # --- paint last known weather into every full frame ---
    const-string v1, "meno"

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "wxt"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :meno_no_wxt

    const v3, 0x7f040004

    invoke-virtual {v0, v3, v2}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    :meno_no_wxt
    const-string v2, "wxi"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :meno_no_wxi

    const v3, 0x7f040006

    invoke-virtual {v0, v3, v2}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    :meno_no_wxi
    # --- end paint ---

    # --- refresh glyph: tap -> TICK -> onUpdate -> WeatherJob fetch/repaint ---
    new-instance v1, Landroid/content/Intent;

    const-string v2, "io.github.shumtugle.meno.TICK"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-class v2, Lio/github/shumtugle/meno/MenoWidget;

    invoke-virtual {v1, p1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    move-result-object v1

    const/16 v2, 0x63

    const v3, 0xc000000

    invoke-static {p1, v2, v1, v3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    const v2, 0x7f040010

    invoke-virtual {v0, v2, v1}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V
    # --- end refresh glyph ---

    invoke-virtual {p2, p3, v0}, Landroid/appwidget/AppWidgetManager;->updateAppWidget([ILandroid/widget/RemoteViews;)V

    return-void
.end method

.method public onAppWidgetOptionsChanged(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;ILandroid/os/Bundle;)V
    .locals 2

    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    aput p3, v0, v1

    invoke-virtual {p0, p1, p2, v0}, Lio/github/shumtugle/meno/MenoWidget;->onUpdate(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;[I)V

    return-void
.end method
