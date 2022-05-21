IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521115450_added3Tebles')
BEGIN
    CREATE TABLE [Users] (
        [Id] int NOT NULL IDENTITY,
        [UserName] nvarchar(max) NULL,
        [Password] nvarchar(max) NULL,
        CONSTRAINT [PK_Users] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521115450_added3Tebles')
BEGIN
    CREATE TABLE [Stacks] (
        [Id] int NOT NULL IDENTITY,
        [StackName] nvarchar(max) NULL,
        [EnvironmentStatusId] int NULL,
        CONSTRAINT [PK_Stacks] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521115450_added3Tebles')
BEGIN
    CREATE TABLE [EnvironmentStatus] (
        [Id] int NOT NULL IDENTITY,
        [EnvironmentName] nvarchar(max) NULL,
        [Credentials] nvarchar(max) NULL,
        [EmployeeName] nvarchar(max) NULL,
        [StackId] int NULL,
        [IsBusy] nvarchar(max) NULL,
        [Notes] nvarchar(max) NULL,
        CONSTRAINT [PK_EnvironmentStatus] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_EnvironmentStatus_Stacks_StackId] FOREIGN KEY ([StackId]) REFERENCES [Stacks] ([Id]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521115450_added3Tebles')
BEGIN
    CREATE INDEX [IX_EnvironmentStatus_StackId] ON [EnvironmentStatus] ([StackId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521115450_added3Tebles')
BEGIN
    CREATE INDEX [IX_Stacks_EnvironmentStatusId] ON [Stacks] ([EnvironmentStatusId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521115450_added3Tebles')
BEGIN
    ALTER TABLE [Stacks] ADD CONSTRAINT [FK_Stacks_EnvironmentStatus_EnvironmentStatusId] FOREIGN KEY ([EnvironmentStatusId]) REFERENCES [EnvironmentStatus] ([Id]) ON DELETE NO ACTION;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521115450_added3Tebles')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220521115450_added3Tebles', N'5.0.17');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521124158_addedEnvironmentStatus')
BEGIN
    ALTER TABLE [EnvironmentStatus] DROP CONSTRAINT [FK_EnvironmentStatus_Stacks_StackId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521124158_addedEnvironmentStatus')
BEGIN
    ALTER TABLE [Stacks] DROP CONSTRAINT [FK_Stacks_EnvironmentStatus_EnvironmentStatusId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521124158_addedEnvironmentStatus')
BEGIN
    DROP INDEX [IX_Stacks_EnvironmentStatusId] ON [Stacks];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521124158_addedEnvironmentStatus')
BEGIN
    DROP INDEX [IX_EnvironmentStatus_StackId] ON [EnvironmentStatus];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521124158_addedEnvironmentStatus')
BEGIN
    DECLARE @var0 sysname;
    SELECT @var0 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Stacks]') AND [c].[name] = N'EnvironmentStatusId');
    IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [Stacks] DROP CONSTRAINT [' + @var0 + '];');
    ALTER TABLE [Stacks] DROP COLUMN [EnvironmentStatusId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521124158_addedEnvironmentStatus')
BEGIN
    DECLARE @var1 sysname;
    SELECT @var1 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[EnvironmentStatus]') AND [c].[name] = N'StackId');
    IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [EnvironmentStatus] DROP CONSTRAINT [' + @var1 + '];');
    ALTER TABLE [EnvironmentStatus] DROP COLUMN [StackId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521124158_addedEnvironmentStatus')
BEGIN
    ALTER TABLE [EnvironmentStatus] ADD [EnvIsApplicableFor] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521124158_addedEnvironmentStatus')
BEGIN
    ALTER TABLE [EnvironmentStatus] ADD [Stack] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521124158_addedEnvironmentStatus')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220521124158_addedEnvironmentStatus', N'5.0.17');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521150755_addedEnvironmentStatusNew')
BEGIN
    DROP TABLE [Stacks];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521150755_addedEnvironmentStatusNew')
BEGIN
    DECLARE @var2 sysname;
    SELECT @var2 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[EnvironmentStatus]') AND [c].[name] = N'EnvironmentName');
    IF @var2 IS NOT NULL EXEC(N'ALTER TABLE [EnvironmentStatus] DROP CONSTRAINT [' + @var2 + '];');
    ALTER TABLE [EnvironmentStatus] ALTER COLUMN [EnvironmentName] nvarchar(max) NOT NULL;
    ALTER TABLE [EnvironmentStatus] ADD DEFAULT N'' FOR [EnvironmentName];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521150755_addedEnvironmentStatusNew')
BEGIN
    DECLARE @var3 sysname;
    SELECT @var3 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[EnvironmentStatus]') AND [c].[name] = N'Credentials');
    IF @var3 IS NOT NULL EXEC(N'ALTER TABLE [EnvironmentStatus] DROP CONSTRAINT [' + @var3 + '];');
    ALTER TABLE [EnvironmentStatus] ALTER COLUMN [Credentials] nvarchar(max) NOT NULL;
    ALTER TABLE [EnvironmentStatus] ADD DEFAULT N'' FOR [Credentials];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220521150755_addedEnvironmentStatusNew')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220521150755_addedEnvironmentStatusNew', N'5.0.17');
END;
GO

COMMIT;
GO

