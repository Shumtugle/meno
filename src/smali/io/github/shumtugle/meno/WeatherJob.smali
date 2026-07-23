.class public Lio/github/shumtugle/meno/WeatherJob;
.super Ljava/lang/Thread;


# instance fields
.field private final ctx:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    iput-object p1, p0, Lio/github/shumtugle/meno/WeatherJob;->ctx:Landroid/content/Context;

    return-void
.end method

.method private static codeToIcon(I)I
    .locals 2

    const/4 v0, 0x0

    if-ne p0, v0, :c1

    const v0, 0x7f020014

    return v0

    :c1
    const/4 v1, 0x2

    if-gt p0, v1, :c2

    const v0, 0x7f020015

    return v0

    :c2
    const/4 v1, 0x3

    if-ne p0, v1, :c3

    const v0, 0x7f020016

    return v0

    :c3
    const/16 v1, 0x30

    if-gt p0, v1, :c4

    const v0, 0x7f020017

    return v0

    :c4
    const/16 v1, 0x39

    if-gt p0, v1, :c5

    const v0, 0x7f020018

    return v0

    :c5
    const/16 v1, 0x43

    if-gt p0, v1, :c6

    const v0, 0x7f020018

    return v0

    :c6
    const/16 v1, 0x4d

    if-gt p0, v1, :c7

    const v0, 0x7f020019

    return v0

    :c7
    const/16 v1, 0x52

    if-gt p0, v1, :c8

    const v0, 0x7f020018

    return v0

    :c8
    const/16 v1, 0x56

    if-gt p0, v1, :c9

    const v0, 0x7f020019

    return v0

    :c9
    const v0, 0x7f02001a

    return v0
.end method

.method private buildUrl()Ljava/lang/String;
    .locals 6

    iget-object v0, p0, Lio/github/shumtugle/meno/WeatherJob;->ctx:Landroid/content/Context;

    const-string v1, "location"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/location/LocationManager;

    const/4 v1, 0x0

    :try_start_0
    const-string v2, "network"

    invoke-virtual {v0, v2}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v1

    if-nez v1, :cond_have

    const-string v2, "passive"

    invoke-virtual {v0, v2}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v1

    if-nez v1, :cond_have

    const-string v2, "gps"

    invoke-virtual {v0, v2}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v1

    :cond_have
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v2

    const/4 v1, 0x0

    :goto_0
    if-nez v1, :cond_loc

    const-string v0, "https://api.open-meteo.com/v1/forecast?latitude=60.17&longitude=24.94&current=temperature_2m,weather_code"

    return-object v0

    :cond_loc
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "https://api.open-meteo.com/v1/forecast?latitude="

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v2, "&longitude="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v2, "&current=temperature_2m,weather_code"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 13

    # --- cadence guard: skip if we fetched less than 9 minutes ago ---
    iget-object v0, p0, Lio/github/shumtugle/meno/WeatherJob;->ctx:Landroid/content/Context;

    const-string v1, "meno"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "wxts"

    const-wide/16 v2, 0x0

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v2

    const-wide/32 v6, 0x83d60

    cmp-long v0, v4, v6

    if-gez v0, :meno_fetch

    return-void

    :meno_fetch
    # --- end cadence guard ---

    :try_start_0
    invoke-direct {p0}, Lio/github/shumtugle/meno/WeatherJob;->buildUrl()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    const/16 v1, 0x1f40

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    new-instance v2, Ljava/util/Scanner;

    invoke-direct {v2, v1}, Ljava/util/Scanner;-><init>(Ljava/io/InputStream;)V

    const-string v1, "\\A"

    invoke-virtual {v2, v1}, Ljava/util/Scanner;->useDelimiter(Ljava/lang/String;)Ljava/util/Scanner;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Scanner;->hasNext()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    return-void

    :cond_0
    invoke-virtual {v2}, Ljava/util/Scanner;->next()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v3, "current"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "temperature_2m"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v3

    const-string v5, "weather_code"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    invoke-static {v5}, Lio/github/shumtugle/meno/WeatherJob;->codeToIcon(I)I

    move-result v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v3, v4}, Ljava/lang/Math;->round(D)J

    move-result-wide v3

    invoke-virtual {v6, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v7, "\u00b0"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    # --- persist weather so the full repaint (onUpdate) can read it ---
    iget-object v8, p0, Lio/github/shumtugle/meno/WeatherJob;->ctx:Landroid/content/Context;

    const-string v9, "meno"

    const/4 v10, 0x0

    invoke-virtual {v8, v9, v10}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v8

    invoke-interface {v8}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    const-string v9, "wxt"

    invoke-interface {v8, v9, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    const-string v9, "wxi"

    invoke-interface {v8, v9, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    const-string v9, "wxts"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    invoke-interface {v8, v9, v11, v12}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    invoke-interface {v8}, Landroid/content/SharedPreferences$Editor;->apply()V
    # --- end persist ---

    new-instance v2, Landroid/widget/RemoteViews;

    iget-object v3, p0, Lio/github/shumtugle/meno/WeatherJob;->ctx:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f030001

    invoke-direct {v2, v3, v4}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    const v3, 0x7f040006

    invoke-virtual {v2, v3, v5}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    const v3, 0x7f040004

    invoke-virtual {v2, v3, v1}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    iget-object v3, p0, Lio/github/shumtugle/meno/WeatherJob;->ctx:Landroid/content/Context;

    invoke-static {v3}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    move-result-object v3

    new-instance v4, Landroid/content/ComponentName;

    iget-object v5, p0, Lio/github/shumtugle/meno/WeatherJob;->ctx:Landroid/content/Context;

    const-class v6, Lio/github/shumtugle/meno/MenoWidget;

    invoke-direct {v4, v5, v6}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v3, v4}, Landroid/appwidget/AppWidgetManager;->getAppWidgetIds(Landroid/content/ComponentName;)[I

    move-result-object v4

    invoke-virtual {v3, v4, v2}, Landroid/appwidget/AppWidgetManager;->partiallyUpdateAppWidget([ILandroid/widget/RemoteViews;)V

    # --- poke a full render (our own TICK) so onUpdate repaints from cached prefs ---
    iget-object v0, p0, Lio/github/shumtugle/meno/WeatherJob;->ctx:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "io.github.shumtugle.meno.TICK"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-class v2, Lio/github/shumtugle/meno/MenoWidget;

    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    # --- end poke ---
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    :goto_1
    return-void
.end method
